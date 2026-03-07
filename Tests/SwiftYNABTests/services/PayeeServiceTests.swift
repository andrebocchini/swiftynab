//
//  PayeeServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Payee Service") struct PayeeServiceTests {
    @Test("Returns all payees for a budget when request succeeds") func payeesReturnsPayeesWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = PayeesRequest.Response(payees: [expectedPayee], serverKnowledge: 1)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.payees(budgetId: "budget_id")

        #expect(actualResponse.count == 1)
        #expect(expectedPayee == actualResponse[0])
    }

    @Test("Throws error when fetching all payees fails") func payeesThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.payees(budgetId: "budget_id")
        }
    }

    @Test("Returns a single payee when request succeeds") func payeeReturnsPayeeWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = PayeeRequest.Response(payee: expectedPayee)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.payee(budgetId: "budget_id", payeeId: "payee_id")

        #expect(expectedPayee == actualResponse)
    }

    @Test("Throws error when fetching a single payee fails") func payeeThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.payee(budgetId: "budget_id", payeeId: "payee_id")
        }
    }

    @Test("Returns updated payee when update request succeeds") func updatePayeeReturnsPayeeWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = UpdatePayeeRequest.Response(
            payee: expectedPayee,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.updatePayee(
            budgetId: "budget_id",
            payeeId: "payee_id",
            payee: SavePayee(name: "name")
        )

        #expect(actualResponse.0 == expectedPayee)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when updating a payee fails") func updatePayeeThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updatePayee(
                budgetId: "id",
                payeeId: "name",
                payee: SavePayee(name: "name")
            )
        }
    }
}
