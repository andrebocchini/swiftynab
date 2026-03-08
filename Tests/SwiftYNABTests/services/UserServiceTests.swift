//
//  UserServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/24/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("User Service")
struct UserServiceTests {
    @Test("Returns user when request succeeds")
    func userReturnsUserWhenRequestSucceeds() async throws {
        let expectedUser = User(id: "123")
        let expectedResponse = UserRequest.Response(user: expectedUser)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = UserService(client: client)
        let actualResponse = try await service.user()

        #expect(expectedUser == actualResponse)
    }

    @Test("Throws error when user request fails")
    func userThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = UserService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.user()
        }
    }
}
