//
//  Request.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

enum Endpoint {
    static let host = "api.ynab.com"
}

protocol Request: Sendable {
    associatedtype Response: Decodable, Sendable

    var path: String { get }
    var method: RequestMethod { get }
    var requiresAuthentication: Bool { get }
    var query: [URLQueryItem]? { get }
    var timeout: TimeInterval { get }

    func body(using serializer: SerializerType) throws -> Data?
}

extension Request {
    var method: RequestMethod {
        .get
    }

    var requiresAuthentication: Bool {
        true
    }

    var query: [URLQueryItem]? {
        nil
    }

    var timeout: TimeInterval {
        60
    }

    func body(using _: SerializerType) throws -> Data? {
        nil
    }

    func urlRequest(using serializer: SerializerType) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = Endpoint.host
        urlComponents.path = path
        urlComponents.queryItems = query

        guard let url = urlComponents.url else {
            throw SwiftYNABError.invalidRequest(path: path)
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = timeout
        request.httpMethod = method.rawValue

        switch method {
        case .patch, .post, .put:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try body(using: serializer)
        case .delete, .get:
            break
        }

        return request
    }
}
