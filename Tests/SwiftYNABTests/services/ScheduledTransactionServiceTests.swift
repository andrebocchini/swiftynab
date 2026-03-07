//
//  ScheduledTransactionServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

// swiftlint:disable:next type_body_length
@Suite("Scheduled Transaction Service") struct ScheduledTransactionServiceTests {
    @Test("Returns a single scheduled transaction when request succeeds") func getScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let expectedTransaction = ScheduledTransactionDetail(
            id: "id",
            dateFirst: "2022-07-07",
            dateNext: "2022-07-08",
            frequency: "",
            amount: 0,
            memo: nil,
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "payee_name",
            categoryId: nil,
            categoryName: nil,
            transferAccountId: nil,
            deleted: false,
            subtransactions: []
        )
        let expectedResponse =
            ScheduledTransactionRequest.Response(scheduledTransaction: expectedTransaction)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.scheduledTransaction(
            budgetId: "budget_id",
            transactionId: "id"
        )

        #expect(expectedTransaction == actualResponse)
    }

    @Test("Throws error when fetching a single scheduled transaction fails") func getScheduledTransactionThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.scheduledTransaction(
                budgetId: "budget_id",
                transactionId: "1234"
            )
        }
    }

    @Test("Returns all scheduled transactions for a budget when request succeeds") func getScheduledTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = ScheduledTransactionDetail(
            id: "id",
            dateFirst: "2022-07-07",
            dateNext: "2022-07-08",
            frequency: "",
            amount: 0,
            memo: nil,
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "payee_name",
            categoryId: nil,
            categoryName: nil,
            transferAccountId: nil,
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = ScheduledTransactionsRequest.Response(
            scheduledTransactions: [expectedTransaction],
            serverKnowledge: 1
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let (transactions, serverKnowledge) = try await service
            .scheduledTransactions(budgetId: "budget_id")

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching all scheduled transactions fails") func getScheduledTransactionsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.scheduledTransactions(budgetId: "budget_id")
        }
    }

    @Test("Returns created scheduled transaction when request succeeds") func createScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let newScheduledTransaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo",
            flagColor: nil,
            frequency: "monthly"
        )
        let expectedScheduledTransaction = ScheduledTransactionDetail(
            id: "scheduled_transaction_id",
            dateFirst: "2022-07-07",
            dateNext: "2022-08-07",
            frequency: "monthly",
            amount: 100,
            memo: "test memo",
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            categoryName: "category_name",
            transferAccountId: nil,
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveScheduledTransactionRequest.Response(
            scheduledTransaction: expectedScheduledTransaction
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.createScheduledTransaction(
            budgetId: "budget_id",
            transaction: newScheduledTransaction
        )

        #expect(expectedScheduledTransaction == actualResponse)
    }

    @Test("Throws error when creating a scheduled transaction fails") func createScheduledTransactionThrowsErrorWhenRequestFails() async {
        let newScheduledTransaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo",
            flagColor: nil,
            frequency: "monthly"
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.createScheduledTransaction(
                budgetId: "budget_id",
                transaction: newScheduledTransaction
            )
        }
    }

    @Test("Returns updated scheduled transaction when request succeeds") func updateScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let updateScheduledTransaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            flagColor: nil,
            frequency: "weekly"
        )
        let expectedScheduledTransaction = ScheduledTransactionDetail(
            id: "scheduled_transaction_id",
            dateFirst: "2022-07-07",
            dateNext: "2022-07-14",
            frequency: "weekly",
            amount: 150,
            memo: "updated memo",
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            categoryName: "category_name",
            transferAccountId: nil,
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveScheduledTransactionRequest.Response(
            scheduledTransaction: expectedScheduledTransaction
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.updateScheduledTransaction(
            budgetId: "budget_id",
            transactionId: "scheduled_transaction_id",
            transaction: updateScheduledTransaction
        )

        #expect(expectedScheduledTransaction == actualResponse)
    }

    @Test("Throws error when updating a scheduled transaction fails") func updateScheduledTransactionThrowsErrorWhenRequestFails() async {
        let updateScheduledTransaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            flagColor: nil,
            frequency: "weekly"
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateScheduledTransaction(
                budgetId: "budget_id",
                transactionId: "scheduled_transaction_id",
                transaction: updateScheduledTransaction
            )
        }
    }

    @Test("Returns deleted scheduled transaction when request succeeds") func deleteScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let expectedScheduledTransaction = ScheduledTransactionDetail(
            id: "scheduled_transaction_id",
            dateFirst: "2022-07-07",
            dateNext: "2022-08-07",
            frequency: "monthly",
            amount: 100,
            memo: "test memo",
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            categoryName: "category_name",
            transferAccountId: nil,
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = DeleteScheduledTransactionRequest.Response(
            scheduledTransaction: expectedScheduledTransaction
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.deleteScheduledTransaction(
            budgetId: "budget_id",
            transactionId: "scheduled_transaction_id"
        )

        #expect(expectedScheduledTransaction == actualResponse)
    }

    @Test("Throws error when deleting a scheduled transaction fails") func deleteScheduledTransactionThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.deleteScheduledTransaction(
                budgetId: "budget_id",
                transactionId: "scheduled_transaction_id"
            )
        }
    }
}
