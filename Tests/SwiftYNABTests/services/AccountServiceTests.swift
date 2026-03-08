//
//  AccountServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Account Service")
struct AccountServiceTests {
    @Test("Returns account when request succeeds")
    func getAccountReturnsAccountWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "name",
            type: .checking,
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            directImportLinked: false,
            directImportInError: false,
            lastReconciledAt: nil,
            debtOriginalBalance: nil,
            debtInterestRates: [:],
            debtMinimumPayments: [:],
            debtEscrowAmounts: [:],
            deleted: false
        )
        let expectedResponse = AccountRequest.Response(account: expectedAccount)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.account(
            budgetId: "budget_id",
            accountId: "account_id"
        )

        #expect(expectedAccount == actualResponse)
    }

    @Test("Throws error when fetching account fails")
    func geAccountThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.account(budgetId: "budget_id", accountId: "account_id")
        }
    }

    @Test("Returns accounts list when request succeeds")
    func accountsReturnsAccountsWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "name",
            type: .checking,
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            directImportLinked: false,
            directImportInError: false,
            lastReconciledAt: nil,
            debtOriginalBalance: nil,
            debtInterestRates: [:],
            debtMinimumPayments: [:],
            debtEscrowAmounts: [:],
            deleted: false
        )
        let expectedResponse = AccountsRequest.Response(
            accounts: [expectedAccount],
            serverKnowledge: 2
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.accounts(
            budgetId: "budget_id",
            lastKnowledgeOfServer: 1
        )

        #expect(actualResponse.accounts.count == 1)
        #expect(expectedAccount == actualResponse.accounts[0])
    }

    @Test("Throws HTTP error when fetching accounts fails")
    func geAccountsThrowsHttpErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.accounts(budgetId: "budget_id", lastKnowledgeOfServer: 1)
        }
    }

    @Test("Throws API error when fetching accounts fails with expired trial")
    func geAccountsThrowsApiErrorWhenRequestFails() async {
        let errorDetails = ErrorDetail(
            id: "403.2",
            name: "trial_expired",
            detail: "The trial for this account has expired"
        )
        let expectedError = SwiftYNABError.apiError(detail: errorDetails)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        await #expect(throws: SwiftYNABError.apiError(detail: errorDetails)) {
            try await service.accounts(budgetId: "budget_id", lastKnowledgeOfServer: 1)
        }
    }

    @Test("Returns newly created budget account when request succeeds")
    func newBudgetAccountsReturnsAccountsWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "account",
            type: .checking,
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            directImportLinked: false,
            directImportInError: false,
            lastReconciledAt: nil,
            debtOriginalBalance: nil,
            debtInterestRates: [:],
            debtMinimumPayments: [:],
            debtEscrowAmounts: [:],
            deleted: false
        )
        let expectedResponse = NewBudgetAccountRequest.Response(account: expectedAccount)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.newBudgetAccount(
            budgetId: "budget_id",
            name: "account",
            type: .checking,
            balance: 0
        )

        #expect(expectedAccount == actualResponse)
    }

    @Test("Throws error when creating budget account fails")
    func newBudgetAccountThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.newBudgetAccount(
                budgetId: "budget_id",
                name: "account",
                type: .checking,
                balance: 0
            )
        }
    }
}
