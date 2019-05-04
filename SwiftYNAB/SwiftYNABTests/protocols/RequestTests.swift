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

    private struct MockGetRequest: Request {
        
        var path = "/testpath"
        
    }
    
    func testPath() {
        let request = MockGetRequest()
        XCTAssertEqual(request.path, "/testpath")
    }
    
    func testMethod() {
        let request = MockGetRequest()
        XCTAssertEqual(request.method, "GET")
    }
    
    func testAuthenticated() {
        let request = MockGetRequest()
        XCTAssertTrue(request.authenticated)
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
        XCTAssertEqual(request.httpMethod, mockRequest.method)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertNil(request.url?.query)
    }
    
    func testPostRequest() {
        
        struct MockPostRequest: Request {
            
            var path = "/testpath"
            var method = "POST"
            var body = "test".data(using: .utf8)!
            
        }
        
        let mockRequest = MockPostRequest()
        let request = mockRequest.request
        
        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
    }
    
    func testPatchRequest() {
        
        struct MockPatchRequest: Request {
            
            var path = "/testpath"
            var method = "PATCH"
            var body = "test".data(using: .utf8)!
            
        }
        
        let mockRequest = MockPatchRequest()
        let request = mockRequest.request
        
        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
    }
    
    func testPutRequest() {
        
        struct MockPutRequest: Request {
            
            var path = "/testpath"
            var method = "PUT"
            var body = "test".data(using: .utf8)!
            
        }
        
        let mockRequest = MockPutRequest()
        let request = mockRequest.request
        
        XCTAssertEqual(request.url?.absoluteString, "https://api.youneedabudget.com/testpath")
        XCTAssertEqual(request.httpMethod, mockRequest.method)
        XCTAssertEqual(request.timeoutInterval, mockRequest.timeout)
        XCTAssertEqual(request.httpBody, mockRequest.body)
        XCTAssertEqual(request.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertNil(request.url?.query)
    }
    
}
