//
//  Request.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

protocol Request {
    
    var path: String { get }
    var method: String { get }
    var authenticated: Bool { get }
    var query: [URLQueryItem]? { get }
    var body: Data? { get }
    var timeout: TimeInterval { get }
    var request: URLRequest { get }
    
}

extension Request {
    
    var method: String {
        return "GET"
    }
    
    var authenticated: Bool {
        return true
    }
    
    var query: [URLQueryItem]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
    
    var timeout: TimeInterval {
        return 60
    }
    
    var request: URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.youneedabudget.com"
        urlComponents.path = "\(self.path)"
        urlComponents.queryItems = self.query
        
        var request = URLRequest(url: urlComponents.url!)
        request.timeoutInterval = self.timeout
        request.httpMethod = self.method
        
        if self.method == "POST" || self.method == "PATCH" || self.method == "PUT"  {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = self.body
        }
        
        return request
    }

}
