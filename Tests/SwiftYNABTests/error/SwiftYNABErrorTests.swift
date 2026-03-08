//
//  SwiftYNABErrorTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/24/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Swift YNAB Error")
struct SwiftYNABErrorTests {
    @Test("Decoding failure errors with different messages are equal")
    func decodingFailureWithDifferentMessagesAreEqual() {
        let error1 = SwiftYNABError.decodingFailure(message: "error1")
        let error2 = SwiftYNABError.decodingFailure(message: "error2")

        #expect(error1 == error2)
    }

    @Test("Decoding failure errors with the same message are equal")
    func decodingFailureWithSameMessagesAreEqual() {
        let error1 = SwiftYNABError.decodingFailure(message: "error1")
        let error2 = SwiftYNABError.decodingFailure(message: "error1")

        #expect(error1 == error2)
    }

    @Test("Encoding failure errors with different messages are equal")
    func encodingFailureWithDifferentMessagesAreEqual() {
        let error1 = SwiftYNABError.encodingFailure(message: "error1")
        let error2 = SwiftYNABError.encodingFailure(message: "error2")

        #expect(error1 == error2)
    }

    @Test("Encoding failure errors with the same message are equal")
    func encodingFailureWithSameMessagesAreEqual() {
        let error1 = SwiftYNABError.encodingFailure(message: "error1")
        let error2 = SwiftYNABError.encodingFailure(message: "error1")

        #expect(error1 == error2)
    }

    @Test("HTTP errors with different status codes are not equal")
    func httpErrorWithDifferentStatusCodesAreNotEqual() {
        let error1 = SwiftYNABError.httpError(statusCode: 200)
        let error2 = SwiftYNABError.httpError(statusCode: 300)

        #expect(error1 != error2)
    }

    @Test("HTTP errors with the same status code are equal")
    func httpErrorWithSameStatusCodesAreEqual() {
        let error1 = SwiftYNABError.httpError(statusCode: 300)
        let error2 = SwiftYNABError.httpError(statusCode: 300)

        #expect(error1 == error2)
    }

    @Test("API errors with different error details are not equal")
    func apiErrorWithDifferentErrorDetailsAreNotEqual() {
        let errorDetail1 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error1 = SwiftYNABError.apiError(detail: errorDetail1)

        let errorDetail2 = ErrorDetail(id: "4", name: "5", detail: "6")
        let error2 = SwiftYNABError.apiError(detail: errorDetail2)

        #expect(error1 != error2)
    }

    @Test("API errors with the same error details are equal")
    func apiErrorWithSameErrorDetailNotEqual() {
        let errorDetail1 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error1 = SwiftYNABError.apiError(detail: errorDetail1)

        let errorDetail2 = ErrorDetail(id: "1", name: "2", detail: "3")
        let error2 = SwiftYNABError.apiError(detail: errorDetail2)

        #expect(error1 == error2)
    }

    @Test("Unknown errors are equal to each other")
    func unknownErrorsAreEqual() {
        #expect(SwiftYNABError.unknown == SwiftYNABError.unknown)
    }

    @Test("Errors of different cases are not equal")
    func differentCasesAreNotEqual() {
        #expect(SwiftYNABError.unknown != SwiftYNABError.httpError(statusCode: 200))
    }
}
