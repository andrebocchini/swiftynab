//
//  BudgetServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Budget Service")
struct BudgetServiceTests {
    @Test("Returns budget summaries when request succeeds")
    func getBudgetsReturnsBudgetsWhenRequestSucceeds() async throws {
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
            currencyFormat: currencyFormat,
            accounts: []
        )
        let expectedResponse = BudgetSummaryRequest.Response(
            budgets: [expectedBudget],
            defaultBudget: nil
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.budgets(includeAccounts: false)

        #expect(actualResponse.count == 1)
        #expect(expectedBudget == actualResponse[0])
    }

    @Test("Throws error when fetching budget summaries fails")
    func getBudgetsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.budgets(includeAccounts: false)
        }
    }

    @Test("Returns budget detail when request succeeds")
    func getBudgetReturnsBudgetWhenRequestSucceeds() async throws {
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
            firstMonth: "january",
            lastMonth: "december",
            dateFormat: dateFormat,
            currencyFormat: currencyFormat,
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
        let expectedResponse = BudgetDetailRequest.Response(
            budget: expectedBudget,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.budget(budgetId: "budget_id")

        #expect(expectedResponse.budget == actualResponse.0)
        #expect(expectedResponse.serverKnowledge == actualResponse.1)
    }

    @Test("Throws error when fetching budget detail fails")
    func getBudgetThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.budget(budgetId: "budget_id")
        }
    }

    @Test("Returns budget settings when request succeeds")
    func getBudgetSettingsReturnsBudgetSettingsWhenRequestSucceeds() async throws {
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
        let expectedResponse = BudgetSettingsRequest.Response(settings: expectedSettings)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = BudgetService(client: client)
        let actualResponse = try await service.budgetSettings(budgetId: "budget_id")

        #expect(expectedSettings == actualResponse)
    }

    @Test("Throws error when fetching budget settings fails")
    func getBudgetSettingsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = BudgetService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.budgetSettings(budgetId: "budget_id")
        }
    }
}
