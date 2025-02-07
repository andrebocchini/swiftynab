//
//  UserServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/24/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class UserServiceTests: XCTestCase {
    func testGetUserReturnsUserWhenRequestSucceeds() async throws {
        let expectedUser = User(id: "123")
        let expectedResponse = UserRequest.Response(user: expectedUser)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = UserService(client: client)
        let actualResponse = try await service.getUser()

        XCTAssertEqual(expectedUser, actualResponse)
    }

    func testGetUserThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = UserService(client: client)

        do {
            _ = try await service.getUser()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
