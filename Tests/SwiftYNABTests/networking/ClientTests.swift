//
//  ClientTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/22/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import SwiftYNAB

class ClientTests: XCTestCase {
    func testHttpErrorThrowsHTTPError() async throws {
        let mockURLResponse = HTTPURLResponse(
            url: URL(string: "https://www.youneedabudget.com")!,
            statusCode: 400,
            httpVersion: nil,
            headerFields: nil
        )!
        let mockData = Data()
        let mockURLSession = MockURLSession(data: mockData, response: mockURLResponse)
        let mockRequest = MockRequest()

        let client = Client(
            accessToken: "",
            urlSession: mockURLSession,
            serializer: Serializer()
        )

        do {
            _ = try await client.perform(mockRequest)
            XCTFail("Expected exception to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 400))
        }
    }

    func testNonParseableResponseThrowsDecodingError() async throws {
        let mockURLResponse = URLResponse(
            url: URL(string: "https://www.youneedabudget.com")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        )
        let mockData = Data()
        let mockURLSession = MockURLSession(data: mockData, response: mockURLResponse)
        let mockRequest = MockRequest()

        let client = Client(
            accessToken: "",
            urlSession: mockURLSession,
            serializer: Serializer()
        )

        do {
            _ = try await client.perform(mockRequest)
            XCTFail("Expected exception to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .decodingFailure(message: "test"))
        }
    }
}

// MARK: Mocks

private struct MockRequest: Request {
    let path = "/test"

    struct Response: Decodable {}
}
