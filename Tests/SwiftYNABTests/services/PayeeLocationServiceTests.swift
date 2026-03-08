//
//  PayeeLocationServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Payee Location Service")
struct PayeeLocationServiceTests {
    @Test("Returns all payee locations when request succeeds")
    func payeeLocationsReturnsLocationsWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = PayeeLocationsRequest.Response(payeeLocations: [expectedLocation])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.payeeLocations(budgetId: "budget_id")

        #expect(actualResponse.count == 1)
        #expect(expectedLocation == actualResponse[0])
    }

    @Test("Throws error when fetching all payee locations fails")
    func payeeLocationsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.payeeLocations(budgetId: "budget_id")
        }
    }

    @Test("Returns a single payee location when request succeeds")
    func payeeLocationReturnsLocationWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = PayeeLocationRequest.Response(payeeLocation: expectedLocation)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.payeeLocation(
            budgetId: "budget_id",
            payeeLocationId: "payee_id"
        )

        #expect(expectedLocation == actualResponse)
    }

    @Test("Throws error when fetching a single payee location fails")
    func payeeLocationThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.payeeLocation(budgetId: "budget_id", payeeLocationId: "payee_id")
        }
    }

    @Test("Returns locations for a specific payee when request succeeds")
    func locationsForPayeeReturnsLocationsWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = LocationsForPayeeRequest.Response(payeeLocations: [expectedLocation])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.locationsForPayee(
            budgetId: "budget_id",
            payeeId: "payee_id"
        )

        #expect(actualResponse.count == 1)
        #expect(expectedLocation == actualResponse[0])
    }

    @Test("Throws error when fetching locations for a specific payee fails")
    func locationsForPayeeThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.locationsForPayee(budgetId: "budget_id", payeeId: "payee_id")
        }
    }
}
