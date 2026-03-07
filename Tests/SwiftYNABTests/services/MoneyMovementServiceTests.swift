//
//  MoneyMovementServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class MoneyMovementServiceTests: XCTestCase {

    // MARK: - Money Movements (all)

    func testMoneyMovementsReturnsMovementsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedMovement, actualResponse.0[0])
        XCTAssertEqual(200, actualResponse.1)
    }

    func testMoneyMovementsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        do {
            _ = try await service.moneyMovements(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // MARK: - Money Movements (by month)

    func testMoneyMovementsByMonthReturnsMovementsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedMovement, actualResponse.0[0])
        XCTAssertEqual(200, actualResponse.1)
    }

    func testMoneyMovementsByMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        do {
            _ = try await service.moneyMovements(budgetId: "budget_id", month: "2024-01-01")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // MARK: - Money Movement Groups (all)

    func testMoneyMovementGroupsReturnsGroupsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedGroup, actualResponse.0[0])
        XCTAssertEqual(200, actualResponse.1)
    }

    func testMoneyMovementGroupsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        do {
            _ = try await service.moneyMovementGroups(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // MARK: - Money Movement Groups (by month)

    func testMoneyMovementGroupsByMonthReturnsGroupsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedGroup, actualResponse.0[0])
        XCTAssertEqual(200, actualResponse.1)
    }

    func testMoneyMovementGroupsByMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MoneyMovementService(client: client)

        do {
            _ = try await service.moneyMovementGroups(budgetId: "budget_id", month: "2024-01-01")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
