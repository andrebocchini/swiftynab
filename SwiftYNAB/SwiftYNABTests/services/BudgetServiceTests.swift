//
//  BudgetServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class BudgetServiceTests: XCTestCase {
    func testGetBudgetsReturnsBudgetsWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedBudget = BudgetSummary(
            id: "budget_id",
            name: "budget",
            lastModifiedOn: "2012-09-27",
            firstMonth: "january",
            lastMonth: "december",
            dateFormat: dateFormat,
            currencyFormat: currencyFormat
        )
        let expectedResponse = BudgetSummaryResponse(budgets: [expectedBudget])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.getBudgets()

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedBudget, actualResponse[0])
    }

    func testGetBudgetsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        do {
            _ = try await service.getBudgets()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetBudgetReturnsBudgetWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedBudget = BudgetDetail(
            id: "budget_id",
            name: "budget_name",
            lastModifiedOn: "2012-09-27",
            dateFormat: dateFormat,
            currencyFormat: currencyFormat,
            firstMonth: "january",
            lastMonth: "december",
            accounts: [],
            payees: [],
            payeeLocations: [],
            categoryGroups: [],
            categories: [],
            months: [],
            transactions: [],
            subtransactions: [],
            scheduledTransactions: [],
            scheduledSubtransactions: []
        )
        let expectedResponse = BudgetDetailResponse(budget: expectedBudget)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.getBudget(budgetId: "budget_id")

        XCTAssertEqual(expectedBudget, actualResponse)
    }

    func testGetBudgetThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        do {
            _ = try await service.getBudget(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetBudgetSettingsReturnsBudgetSettingsWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedSettings = BudgetSettings(
            dateFormat: dateFormat,
            currencyFormat: currencyFormat
        )
        let expectedResponse = BudgetSettingsResponse(settings: expectedSettings)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.getBudgetSettings(budgetId: "budget_id")

        XCTAssertEqual(expectedSettings, actualResponse)
    }

    func testGetBudgetSettingsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        do {
            _ = try await service.getBudgetSettings(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
