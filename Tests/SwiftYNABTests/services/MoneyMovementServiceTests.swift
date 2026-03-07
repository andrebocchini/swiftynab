//
//  MoneyMovementServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Money Movement Service") struct MoneyMovementServiceTests {

    // MARK: - Money Movements (all)

    @Test("Returns all money movements when request succeeds") func moneyMovementsReturnsMovementsWhenRequestSucceeds() async throws {
        let expectedMovement = MoneyMovement(
            id: "id",
            month: "2024-01-01",
            movedAt: nil,
            note: nil,
            moneyMovementGroupId: nil,
            performedByUserId: nil,
            fromCategoryId: nil,
            toCategoryId: nil,
            amount: 1000
        )
        let expectedResponse = MoneyMovementsRequest.Response(
            moneyMovements: [expectedMovement],
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MoneyMovementService(client: client)
        let actualResponse = try await service.moneyMovements(budgetId: "budget_id")

        #expect(actualResponse.0.count == 1)
        #expect(expectedMovement == actualResponse.0[0])
        #expect(200 == actualResponse.1)
    }

    @Test("Throws error when fetching all money movements fails") func moneyMovementsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.moneyMovements(budgetId: "budget_id")
        }
    }

    // MARK: - Money Movements (by month)

    @Test("Returns money movements for a specific month when request succeeds") func moneyMovementsByMonthReturnsMovementsWhenRequestSucceeds() async throws {
        let expectedMovement = MoneyMovement(
            id: "id",
            month: "2024-01-01",
            movedAt: nil,
            note: nil,
            moneyMovementGroupId: nil,
            performedByUserId: nil,
            fromCategoryId: nil,
            toCategoryId: nil,
            amount: 1000
        )
        let expectedResponse = MoneyMovementsByMonthRequest.Response(
            moneyMovements: [expectedMovement],
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MoneyMovementService(client: client)
        let actualResponse = try await service.moneyMovements(
            budgetId: "budget_id",
            month: "2024-01-01"
        )

        #expect(actualResponse.0.count == 1)
        #expect(expectedMovement == actualResponse.0[0])
        #expect(200 == actualResponse.1)
    }

    @Test("Throws error when fetching money movements by month fails") func moneyMovementsByMonthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.moneyMovements(budgetId: "budget_id", month: "2024-01-01")
        }
    }

    // MARK: - Money Movement Groups (all)

    @Test("Returns all money movement groups when request succeeds") func moneyMovementGroupsReturnsGroupsWhenRequestSucceeds() async throws {
        let expectedGroup = MoneyMovementGroup(
            id: "id",
            groupCreatedAt: "2024-01-01T12:00:00Z",
            month: "2024-01-01",
            note: nil,
            performedByUserId: nil
        )
        let expectedResponse = MoneyMovementGroupsRequest.Response(
            moneyMovementGroups: [expectedGroup],
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MoneyMovementService(client: client)
        let actualResponse = try await service.moneyMovementGroups(budgetId: "budget_id")

        #expect(actualResponse.0.count == 1)
        #expect(expectedGroup == actualResponse.0[0])
        #expect(200 == actualResponse.1)
    }

    @Test("Throws error when fetching all money movement groups fails") func moneyMovementGroupsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.moneyMovementGroups(budgetId: "budget_id")
        }
    }

    // MARK: - Money Movement Groups (by month)

    @Test("Returns money movement groups for a specific month when request succeeds") func moneyMovementGroupsByMonthReturnsGroupsWhenRequestSucceeds() async throws {
        let expectedGroup = MoneyMovementGroup(
            id: "id",
            groupCreatedAt: "2024-01-01T12:00:00Z",
            month: "2024-01-01",
            note: nil,
            performedByUserId: nil
        )
        let expectedResponse = MoneyMovementGroupsByMonthRequest.Response(
            moneyMovementGroups: [expectedGroup],
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MoneyMovementService(client: client)
        let actualResponse = try await service.moneyMovementGroups(
            budgetId: "budget_id",
            month: "2024-01-01"
        )

        #expect(actualResponse.0.count == 1)
        #expect(expectedGroup == actualResponse.0[0])
        #expect(200 == actualResponse.1)
    }

    @Test("Throws error when fetching money movement groups by month fails") func moneyMovementGroupsByMonthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.moneyMovementGroups(budgetId: "budget_id", month: "2024-01-01")
        }
    }
}
