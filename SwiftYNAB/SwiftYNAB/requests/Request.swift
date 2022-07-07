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
    var method: RequestMethod { get }
    var requiresAuthentication: Bool { get }
    var query: [URLQueryItem]? { get }
    var body: Data? { get }
    var timeout: TimeInterval { get }
    var request: URLRequest { get }
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

    var body: Data? {
        nil
    }

    var timeout: TimeInterval {
        60
    }

    var request: URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.youneedabudget.com"
        urlComponents.path = "\(path)"
        urlComponents.queryItems = query

        var request = URLRequest(url: urlComponents.url!)
        request.timeoutInterval = timeout
        request.httpMethod = method.rawValue

        switch method {
        case .patch, .post, .put:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        case .get:
            break
        }

        return request
    }
}
