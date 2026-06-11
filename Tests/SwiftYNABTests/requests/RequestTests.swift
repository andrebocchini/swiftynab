//
//  RequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif
import Testing
@testable import SwiftYNAB

@Suite("Request")
struct RequestTests {
    @Test("Default path returns the configured path value")
    func path() {
        let request = MockGetRequest()
        #expect(request.path == "/testpath")
    }

    @Test("Default method is GET")
    func method() {
        let request = MockGetRequest()
        #expect(request.method == .get)
    }

    @Test("Request requires authentication by default")
    func requiresAuthentication() {
        let request = MockGetRequest()
        #expect(request.requiresAuthentication)
    }

    @Test("Default query is nil")
    func query() {
        let request = MockGetRequest()
        #expect(request.query == nil)
    }

    @Test("Default body is nil")
    func body() throws {
        let request = MockGetRequest()
        #expect(try request.body(using: Serializer()) == nil)
    }

    @Test("Default timeout is 60 seconds")
    func timeout() {
        let request = MockGetRequest()
        #expect(request.timeout == 60)
    }

    @Test("GET request builds URL with correct base URL, method, and timeout")
    func getRequest() throws {
        let mockRequest = MockGetRequest()
        let request = try mockRequest.urlRequest(using: Serializer())

        #expect(request.url?.absoluteString == "https://api.ynab.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(request.url?.query == nil)
    }

    @Test("POST request includes body and Content-Type header")
    func postRequest() throws {
        let mockRequest = MockPostRequest()
        let request = try mockRequest.urlRequest(using: Serializer())

        #expect(request.url?.absoluteString == "https://api.ynab.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(try request.httpBody == mockRequest.body(using: Serializer()))
        let postHeaders = try #require(request.allHTTPHeaderFields)
        #expect(postHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
    }

    @Test("PATCH request includes body and Content-Type header")
    func patchRequest() throws {
        let mockRequest = MockPatchRequest()
        let request = try mockRequest.urlRequest(using: Serializer())

        #expect(request.url?.absoluteString == "https://api.ynab.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(try request.httpBody == mockRequest.body(using: Serializer()))
        let patchHeaders = try #require(request.allHTTPHeaderFields)
        #expect(patchHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
    }

    @Test("PUT request includes body and Content-Type header")
    func putRequest() throws {
        let mockRequest = MockPutRequest()
        let request = try mockRequest.urlRequest(using: Serializer())

        #expect(request.url?.absoluteString == "https://api.ynab.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(try request.httpBody == mockRequest.body(using: Serializer()))
        let putHeaders = try #require(request.allHTTPHeaderFields)
        #expect(putHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
    }

    @Test("Body encoding errors propagate when building the request")
    func bodyEncodingErrorPropagates() {
        let mockRequest = MockThrowingBodyRequest()

        #expect(throws: SwiftYNABError.encodingFailure(message: "test")) {
            try mockRequest.urlRequest(using: Serializer())
        }
    }
}

// MARK: Mocks

private struct MockGetRequest: Request {
    typealias Response = String

    var path = "/testpath"
}

struct MockPostRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .post

    func body(using _: SerializerType) throws -> Data? {
        Data("test".utf8)
    }
}

struct MockPatchRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .patch

    func body(using _: SerializerType) throws -> Data? {
        Data("test".utf8)
    }
}

struct MockPutRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .put

    func body(using _: SerializerType) throws -> Data? {
        Data("test".utf8)
    }
}

private struct MockThrowingBodyRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .post

    func body(using _: SerializerType) throws -> Data? {
        throw SwiftYNABError.encodingFailure(message: "test")
    }
}
