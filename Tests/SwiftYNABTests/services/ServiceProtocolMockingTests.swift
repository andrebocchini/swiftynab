//
//  ServiceProtocolMockingTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing

// This file deliberately does NOT use @testable so it verifies that consumers of the
// library can mock the service protocols in their own tests using only the public API.
import SwiftYNAB

@Suite("Service Protocol Mocking")
struct ServiceProtocolMockingTests {
    @Test("Consumers can substitute a mock for a service protocol")
    func mockServiceSatisfiesProtocol() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "Checking",
            type: .checking,
            onBudget: true,
            closed: false,
            note: nil,
            balance: 120_000,
            balanceFormatted: nil,
            balanceCurrency: nil,
            clearedBalance: 120_000,
            clearedBalanceFormatted: nil,
            clearedBalanceCurrency: nil,
            unclearedBalance: 0,
            unclearedBalanceFormatted: nil,
            unclearedBalanceCurrency: nil,
            transferPayeeId: nil,
            directImportLinked: nil,
            directImportInError: nil,
            lastReconciledAt: nil,
            debtOriginalBalance: nil,
            debtInterestRates: nil,
            debtMinimumPayments: nil,
            debtEscrowAmounts: nil,
            deleted: false
        )
        let service: any AccountServiceType = MockAccountService(
            expectedResponse: AccountsResponse(
                accounts: [expectedAccount],
                serverKnowledge: 100
            )
        )

        let response = try await service.accounts(planId: "plan_id")

        #expect(response.accounts == [expectedAccount])
        #expect(response.serverKnowledge == 100)
    }

    @Test("Legacy transaction mocks receive inclusive until date support")
    func legacyTransactionMockSupportsUntilDate() async throws {
        let service: any TransactionServiceType = MockLegacyTransactionService(
            expectedResponse: TransactionsResponse(
                transactions: [
                    transaction(id: "before", date: "2025-01-01"),
                    transaction(id: "inclusive", date: "2025-01-15"),
                    transaction(id: "after", date: "2025-01-16")
                ],
                serverKnowledge: 321
            )
        )
        let untilDate = try #require(DateConverter.date(from: "2025-01-15"))

        let response = try await service.transactions(
            planId: "plan_id",
            untilDate: untilDate
        )

        #expect(response.transactions.map(\.id) == ["before", "inclusive"])
        #expect(response.serverKnowledge == 321)
    }
}

// MARK: Mocks

private struct MockAccountService: AccountServiceType {
    let expectedResponse: AccountsResponse

    func account(planId _: String, accountId _: String) async throws -> Account {
        expectedResponse.accounts[0]
    }

    func accounts(
        planId _: String,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> AccountsResponse {
        expectedResponse
    }

    func newPlanAccount(
        planId _: String,
        name _: String,
        type _: SaveAccountType,
        balance _: Int
    ) async throws -> Account {
        expectedResponse.accounts[0]
    }
}

private struct MockLegacyTransactionService: TransactionServiceType {
    let expectedResponse: TransactionsResponse

    func transaction(planId _: String, transactionId _: String) async throws
        -> TransactionResponse
    {
        fatalError("Not used by this test")
    }

    func transactions(
        planId _: String,
        sinceDate _: Date?,
        type _: TransactionType?,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        expectedResponse
    }

    func transactions(
        planId _: String,
        accountId _: String,
        sinceDate _: Date?,
        type _: TransactionType?,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        expectedResponse
    }

    func transactions(
        planId _: String,
        categoryId _: String,
        sinceDate _: Date?,
        type _: TransactionType?,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse {
        HybridTransactionsResponse(transactions: [], serverKnowledge: nil)
    }

    func transactions(
        planId _: String,
        payeeId _: String,
        sinceDate _: Date?,
        type _: TransactionType?,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse {
        HybridTransactionsResponse(transactions: [], serverKnowledge: nil)
    }

    func transactions(
        planId _: String,
        month _: Date,
        sinceDate _: Date?,
        type _: TransactionType?,
        lastKnowledgeOfServer _: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        expectedResponse
    }

    func createTransaction(planId _: String, transaction _: NewTransaction) async throws
        -> SaveTransactionResponse
    {
        fatalError("Not used by this test")
    }

    func createTransactions(planId _: String, transactions _: [NewTransaction]) async throws
        -> SaveTransactionsResponse
    {
        fatalError("Not used by this test")
    }

    func updateTransactions(
        planId _: String,
        transactions _: [SaveTransactionWithIdOrImportId]
    ) async throws -> SaveTransactionsResponse {
        fatalError("Not used by this test")
    }

    func updateTransaction(
        planId _: String,
        transactionId _: String,
        transaction _: ExistingTransaction
    ) async throws -> TransactionResponse {
        fatalError("Not used by this test")
    }

    func importTransactions(planId _: String) async throws -> [String] {
        fatalError("Not used by this test")
    }

    func deleteTransaction(planId _: String, transactionId _: String) async throws
        -> TransactionResponse
    {
        fatalError("Not used by this test")
    }
}

private func transaction(id: String, date: String) -> TransactionDetail {
    TransactionDetail(
        id: id,
        date: date,
        amount: 0,
        amountFormatted: nil,
        amountCurrency: nil,
        memo: nil,
        cleared: .cleared,
        approved: true,
        flagColor: nil,
        flagName: nil,
        accountId: "account_id",
        accountName: "Checking",
        payeeId: nil,
        payeeName: nil,
        categoryId: nil,
        categoryName: nil,
        transferAccountId: nil,
        transferTransactionId: nil,
        matchedTransactionId: nil,
        importId: nil,
        importPayeeName: nil,
        importPayeeNameOriginal: nil,
        debtTransactionType: nil,
        deleted: false,
        subtransactions: []
    )
}
