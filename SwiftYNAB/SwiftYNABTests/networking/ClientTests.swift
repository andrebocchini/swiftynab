//
//  ClientTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/22/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class ClientTests: XCTestCase {
    func testValidResponseResultsInMappedResponse() async throws {
        let mockURLResponse = URLResponse()
        let mockModel = MockModel(test: "test")
        let mockResponse = Response(data: mockModel)
        let mockData = try JSONEncoder().encode(mockResponse)
        let mockURLSession = MockURLSession(data: mockData, response: mockURLResponse)
        let mockRequest = MockRequest()

        let client = Client(
            accessToken: "",
            urlSession: mockURLSession,
            serializer: Serializer.shared
        )
        let actualResponse: MockModel = try await client.request(mockRequest)

        XCTAssertEqual(mockModel, actualResponse)
    }

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
            serializer: Serializer.shared
        )

        do {
            let _: MockModel = try await client.request(mockRequest)
            XCTFail("Expected exception to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 400))
        }
    }

    func testNonParseableResponseThrowsDecodingError() async throws {
        let mockURLResponse = URLResponse()
        let mockData = Data()
        let mockURLSession = MockURLSession(data: mockData, response: mockURLResponse)
        let mockRequest = MockRequest()

        let client = Client(
            accessToken: "",
            urlSession: mockURLSession,
            serializer: Serializer.shared
        )

        do {
            let _: MockModel = try await client.request(mockRequest)
            XCTFail("Expected exception to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .decodingFailure(message: "test"))
        }
    }
}

// MARK: Mocks

private struct MockRequest: Request {
    let path = "/test"
}

private struct MockModel: Codable, Equatable {
    let test: String
}
