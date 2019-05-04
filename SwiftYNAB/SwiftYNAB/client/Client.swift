//
//  Client.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

class Client {
    
    private(set) var accessToken: String
    
    private var authorizationHeader: String {
        return "Bearer \(self.accessToken)"
    }
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    private func isHTTPError(response: HTTPURLResponse) -> Bool {
        return response.statusCode >= 400
    }

     func request<T: Codable>(_ request: Request, completion: @escaping (T?, ErrorDetail?) -> Void) {
        var urlRequest = request.request
        if (request.authenticated) {
            urlRequest.setValue(self.authorizationHeader, forHTTPHeaderField: "Authorization")
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: urlRequest) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let httpURLResponse = response as? HTTPURLResponse, let data = data else {
                completion(nil, ErrorDetail.defaultErrorDetail)
                return
            }
            
            do {
                if self.isHTTPError(response: httpURLResponse) {
                    let serializedResponse = try Serializer.decode(ErrorResponse.self, from: data)
                    completion(nil, serializedResponse.error)
                } else {
                    let serializedResponse = try Serializer.decode(T.self, from: data)
                    completion(serializedResponse, nil)
                }
            } catch let decodingError as SerializationError {
                completion(nil, ErrorDetail.errorDetail(from: decodingError))
            } catch {
                completion(nil, ErrorDetail.defaultErrorDetail)
            }
        }
        task.resume()
    }
}
