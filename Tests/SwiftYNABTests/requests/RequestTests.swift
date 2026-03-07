//
//  RequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Request") struct RequestTests {
    @Test("Default path returns the configured path value") func path() {
        let request = MockGetRequest()
        #expect(request.path == "/testpath")
    }

    @Test("Default method is GET") func method() {
        let request = MockGetRequest()
        #expect(request.method == .get)
    }

    @Test("Request requires authentication by default") func requiresAuthentication() {
        let request = MockGetRequest()
        #expect(request.requiresAuthentication)
    }

    @Test("Default query is nil") func query() {
        let request = MockGetRequest()
        #expect(request.query == nil)
    }

    @Test("Default body is nil") func body() {
        let request = MockGetRequest()
        #expect(request.body == nil)
    }

    @Test("Default timeout is 60 seconds") func timeout() {
        let request = MockGetRequest()
        #expect(request.timeout == 60)
    }

    @Test("GET request builds URL with correct base URL, method, and timeout") func getRequest() {
        let mockRequest = MockGetRequest()
        let request = mockRequest.request

        #expect(request.url?.absoluteString == "https://api.youneedabudget.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(request.url?.query == nil)
    }

    @Test("POST request includes body and Content-Type header") func postRequest() throws {
        let mockRequest = MockPostRequest()
        let request = mockRequest.request

        #expect(request.url?.absoluteString == "https://api.youneedabudget.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(request.httpBody == mockRequest.body)
        let postHeaders = try #require(request.allHTTPHeaderFields)
        #expect(postHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
    }

    @Test("PATCH request includes body and Content-Type header") func patchRequest() throws {
        let mockRequest = MockPatchRequest()
        let request = mockRequest.request

        #expect(request.url?.absoluteString == "https://api.youneedabudget.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(request.httpBody == mockRequest.body)
        let patchHeaders = try #require(request.allHTTPHeaderFields)
        #expect(patchHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
    }

    @Test("PUT request includes body and Content-Type header") func putRequest() throws {
        let mockRequest = MockPutRequest()
        let request = mockRequest.request

        #expect(request.url?.absoluteString == "https://api.youneedabudget.com/testpath")
        #expect(request.httpMethod == mockRequest.method.rawValue)
        #expect(request.timeoutInterval == mockRequest.timeout)
        #expect(request.httpBody == mockRequest.body)
        let putHeaders = try #require(request.allHTTPHeaderFields)
        #expect(putHeaders["Content-Type"] == "application/json")
        #expect(request.url?.query == nil)
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
    // swiftlint:disable:next non_optional_string_data_conversion
    var body = "test".data(using: .utf8)!
}

struct MockPatchRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .patch
    // swiftlint:disable:next non_optional_string_data_conversion
    var body = "test".data(using: .utf8)!
}

struct MockPutRequest: Request {
    typealias Response = String

    var path = "/testpath"
    var method: RequestMethod = .put
    // swiftlint:disable:next non_optional_string_data_conversion
    var body = "test".data(using: .utf8)!
}
