//
//  RequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class RequestTests: XCTestCase {
    func testPath() {
        let request = MockGetRequest()
        XCTAssertEqual(request.path, "/testpath")
    }

    func testMethod() {
        let request = MockGetRequest()
        XCTAssertEqual(request.method, .get)
    }

    func testRequiresAuthentication() {
        let request = MockGetRequest()
        XCTAssertTrue(request.requiresAuthentication)
    }

    func testQuery() {
        let request = MockGetRequest()
        XCTAssertNil(request.query)
    }

    func testBody() {
        let request = MockGetRequest()
        XCTAssertNil(request.body)
    }

    func testTimeout() {
        let request = MockGetRequest()
        XCTAssertEqual(request.timeout, 60)
    }

    func testGetRequest() {
        let mockRequest = MockGetRequest()
        let request = mockRequest.request

        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method.rawValue)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertNil(request.url?.query)
    }

    func testPostRequest() {
        let mockRequest = MockPostRequest()
        let request = mockRequest.request

        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method.rawValue)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
    }

    func testPatchRequest() {
        let mockRequest = MockPatchRequest()
        let request = mockRequest.request

        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method.rawValue)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
    }

    func testPutRequest() {
        let mockRequest = MockPutRequest()
        let request = mockRequest.request

        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method.rawValue)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
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
