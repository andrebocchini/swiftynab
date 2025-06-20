//
//  MonthServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class MonthServiceTests: XCTestCase {
    func testMonthsReturnsMonthsWhenRequestSucceeds() async throws {
        let expectedMonth = MonthSummary(
            month: "april",
            note: nil,
            income: 0,
            budgeted: 0,
            activity: 0,
            toBeBudgeted: 0,
            ageOfMoney: nil,
            deleted: false
        )
        let expectedResponse = MonthsRequest.Response(months: [expectedMonth], serverKnowledge: 200)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.months(
            budgetId: "budget_id",
            lastKnowledgeOfServer: 200
        )

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedMonth, actualResponse.0[0])
        XCTAssertEqual(actualResponse.1, 200)
    }

    func testMonthsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        do {
            _ = try await service.months(budgetId: "budget_id", lastKnowledgeOfServer: 200)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testMonthReturnsMonthWhenRequestSucceeds() async throws {
        let expectedMonth = MonthDetail(
            month: "april",
            note: nil,
            income: 0,
            budgeted: 0,
            activity: 0,
            toBeBudgeted: 0,
            ageOfMoney: nil,
            deleted: false,
            categories: []
        )
        let expectedResponse = MonthRequest.Response(month: expectedMonth)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.month(budgetId: "budget_id", month: "april")

        XCTAssertEqual(expectedMonth, actualResponse)
    }

    func testMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        do {
            _ = try await service.month(budgetId: "budget_id", month: "april")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
