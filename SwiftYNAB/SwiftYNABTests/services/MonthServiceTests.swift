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
    func testGetMonthsReturnsMonthsWhenRequestSucceeds() async throws {
        let expectedMonth = MonthSummary(
            month: "april",
            note: nil,
            income: nil,
            budgeted: nil,
            activity: nil,
            toBeBudgeted: nil,
            ageOfMoney: nil,
            deleted: false
        )
        let expectedResponse = MonthsResponse(months: [expectedMonth])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.getMonths(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedMonth, actualResponse[0])
    }

    func testGetMonthsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        do {
            _ = try await service.getMonths(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetMonthReturnsMonthWhenRequestSucceeds() async throws {
        let expectedMonth = MonthDetail(
            month: "april",
            note: nil,
            income: nil,
            budgeted: nil,
            activity: nil,
            toBeBudgeted: nil,
            ageOfMoney: nil,
            deleted: false,
            categories: []
        )
        let expectedResponse = MonthResponse(month: expectedMonth)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.getMonth(budgetId: "budget_id", month: "april")

        XCTAssertEqual(expectedMonth, actualResponse)
    }

    func testGetMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        do {
            _ = try await service.getMonth(budgetId: "budget_id", month: "april")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
