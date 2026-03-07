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
import Testing
@testable import SwiftYNAB

@Suite("Client") struct ClientTests {
    @Test("Throws an HTTP error when the response has a non-success status code") func httpErrorThrowsHTTPError() async {
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

        await #expect(throws: SwiftYNABError.httpError(statusCode: 400)) {
            try await client.perform(mockRequest)
        }
    }

    @Test("Throws a decoding error when the response cannot be parsed") func nonParseableResponseThrowsDecodingError() async {
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

        await #expect(throws: SwiftYNABError.decodingFailure(message: "test")) {
            try await client.perform(mockRequest)
        }
    }
}

// MARK: Mocks

private struct MockRequest: Request {
    let path = "/test"

    struct Response: Decodable {}
}
