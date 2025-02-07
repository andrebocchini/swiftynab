//
//  SwiftYNABErrorTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/24/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class SwiftYNABErrorTests: XCTestCase {
    func testDecodingFailureWithDifferentMessagesAreEqual() {
        let error1 = SwiftYNABError.decodingFailure(message: "error1")
        let error2 = SwiftYNABError.decodingFailure(message: "error2")

        XCTAssertEqual(error1, error2)
    }

    func testDecodingFailureWithSameMessagesAreEqual() {
        let error1 = SwiftYNABError.decodingFailure(message: "error1")
        let error2 = SwiftYNABError.decodingFailure(message: "error1")

        XCTAssertEqual(error1, error2)
    }

    func testEncodingFailureWithDifferentMessagesAreEqual() {
        let error1 = SwiftYNABError.encodingFailure(message: "error1")
        let error2 = SwiftYNABError.encodingFailure(message: "error2")

        XCTAssertEqual(error1, error2)
    }

    func testEncodingFailureWithSameMessagesAreEqual() {
        let error1 = SwiftYNABError.encodingFailure(message: "error1")
        let error2 = SwiftYNABError.encodingFailure(message: "error1")

        XCTAssertEqual(error1, error2)
    }

    func testHTTPErrorWithDifferentStatusCodesAreNotEqual() {
        let error1 = SwiftYNABError.httpError(statusCode: 200)
        let error2 = SwiftYNABError.httpError(statusCode: 300)

        XCTAssertNotEqual(error1, error2)
    }

    func testHTTPErrorWithSameStatusCodesAreEqual() {
        let error1 = SwiftYNABError.httpError(statusCode: 300)
        let error2 = SwiftYNABError.httpError(statusCode: 300)

        XCTAssertEqual(error1, error2)
    }

    func testApiErrorWithDifferentErrorDetailsAreNotEqual() {
        let errorDetail1 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error1 = SwiftYNABError.apiError(detail: errorDetail1)

        let errorDetail2 = ErrorDetail(id: "4", name: "5", detail: "6")
        let error2 = SwiftYNABError.apiError(detail: errorDetail2)

        XCTAssertNotEqual(error1, error2)
    }

    func testApiErrorWithSameErrorDetailNotEqual() {
        let errorDetail1 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error1 = SwiftYNABError.apiError(detail: errorDetail1)

        let errorDetail2 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error2 = SwiftYNABError.apiError(detail: errorDetail2)

        XCTAssertEqual(error1, error2)
    }

    func testUnknownErrorsAreEqual() {
        XCTAssertEqual(SwiftYNABError.unknown, SwiftYNABError.unknown)
    }

    func testDifferentCasesAreNotEqual() {
        XCTAssertNotEqual(SwiftYNABError.unknown, SwiftYNABError.httpError(statusCode: 200))
    }
}
