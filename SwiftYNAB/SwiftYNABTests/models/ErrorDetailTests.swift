//
//  ErrorDetailTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class ErrorDetailTests: XCTestCase {

    func testErrorDetailDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(ErrorDetail.self))
    }
    
    func testEquatable() {
        let expectedValue = ErrorDetail(id: "000", name: "Unknown", detail: "Unknown")
        let testValue = ErrorDetail(id: "000", name: "Unknown", detail: "Unknown")
        
        XCTAssertEqual(expectedValue, testValue)
    }
    
    func testDefaultError() {
        let expectedValue = ErrorDetail(id: "000", name: "Unknown", detail: "Unknown error occurred")
        let testValue = ErrorDetail.defaultErrorDetail
        
        XCTAssertEqual(expectedValue, testValue)
    }
    
    func testDecodingError() {
        let expectedValue = ErrorDetail(id: "000", name: "Decoding Error", detail: "Failure")
        let decodingError = SerializationError.decodingFailure(message: "Failure")
        let testValue = ErrorDetail.errorDetail(from: decodingError)
        
        XCTAssertEqual(expectedValue, testValue)
    }
    
    func testEncodingError() {
        let expectedValue = ErrorDetail(id: "000", name: "Encoding Error", detail: "Failure")
        let encodingError = SerializationError.encodingFailure(message: "Failure")
        let testValue = ErrorDetail.errorDetail(from: encodingError)
        
        XCTAssertEqual(expectedValue, testValue)
    }

}
