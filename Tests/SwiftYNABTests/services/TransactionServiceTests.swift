//
//  TransactionServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

// swiftlint:disable:next type_body_length
@Suite("Transaction Service") struct TransactionServiceTests {
    @Test("Returns a single transaction when request succeeds") func getTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
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
        let expectedResponse = TransactionRequest.Response(
            transaction: expectedTransaction,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.transaction(
            budgetId: "budget_id",
            transactionId: "id"
        )

        #expect(expectedTransaction == actualResponse.0)
        #expect(200 == actualResponse.1)
    }

    @Test("Throws error when fetching a single transaction fails") func getTransactionThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transaction(budgetId: "budget_id", transactionId: "id")
        }
    }

    @Test("Returns transactions for a budget when request succeeds") func getTransactionsByBudgetReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
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
        let expectedResponse = TransactionsByBudgetRequest.Response(
            transactions: [expectedTransaction],
            serverKnowledge: 1
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let (transactions, serverKnowledge) = try await service.transactions(budgetId: "budget_id")

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching transactions by budget fails") func getTransactionsByBudgetThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transactions(budgetId: "budget_id")
        }
    }

    @Test("Returns transactions for an account when request succeeds") func getTransactionsByAccountReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
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
        let expectedResponse = TransactionsByAccountRequest.Response(
            transactions: [expectedTransaction],
            serverKnowledge: 1
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let (transactions, serverKnowledge) = try await service.transactions(
            budgetId: "budget_id",
            accountId: "account_id"
        )

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching transactions by account fails") func getTransactionsByAccountThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transactions(budgetId: "budget_id", accountId: "account_id")
        }
    }

    @Test("Returns transactions for a category when request succeeds") func getTransactionsByCategoryReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = HybridTransaction(
            type: "type",
            parentTransactionId: nil,
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: nil,
            payeeName: nil,
            categoryId: "category_id",
            categoryName: "",
            transferAccountId: nil,
            transferTransactionId: nil,
            matchedTransactionId: nil,
            importId: nil,
            importPayeeName: nil,
            importPayeeNameOriginal: nil,
            debtTransactionType: .charge,
            deleted: false
        )
        let expectedResponse = TransactionsByCategoryRequest
            .Response(transactions: [expectedTransaction], serverKnowledge: 1)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let (transactions, serverKnowledge) = try await service.transactions(
            budgetId: "budget_id",
            categoryId: "category_id"
        )

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching transactions by category fails") func getTransactionsByCategoryThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transactions(budgetId: "budget_id", categoryId: "category_id")
        }
    }

    @Test("Returns transactions for a payee when request succeeds") func getTransactionsByPayeeReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = HybridTransaction(
            type: "type",
            parentTransactionId: nil,
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: nil,
            categoryId: "category_id",
            categoryName: "",
            transferAccountId: nil,
            transferTransactionId: nil,
            matchedTransactionId: nil,
            importId: nil,
            importPayeeName: nil,
            importPayeeNameOriginal: nil,
            debtTransactionType: .charge,
            deleted: false
        )
        let expectedResponse = TransactionsByPayeeRequest
            .Response(transactions: [expectedTransaction], serverKnowledge: 1)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let (transactions, serverKnowledge) = try await service.transactions(
            budgetId: "budget_id",
            payeeId: "payee_id"
        )

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching transactions by payee fails") func getTransactionsByPayeeThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transactions(budgetId: "budget_id", payeeId: "payee_id")
        }
    }

    @Test("Returns transactions for a month when request succeeds") func getTransactionsByMonthReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = HybridTransaction(
            type: "type",
            parentTransactionId: nil,
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: nil,
            categoryId: "category_id",
            categoryName: "",
            transferAccountId: nil,
            transferTransactionId: nil,
            matchedTransactionId: nil,
            importId: nil,
            importPayeeName: nil,
            importPayeeNameOriginal: nil,
            debtTransactionType: .charge,
            deleted: false
        )
        let expectedResponse = TransactionsByMonthRequest
            .Response(transactions: [expectedTransaction], serverKnowledge: 1)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let (transactions, serverKnowledge) = try await service.transactions(
            budgetId: "budget_id",
            month: Date.now
        )

        #expect(transactions.count == 1)
        #expect(expectedTransaction == transactions.first)
        #expect(serverKnowledge == 1)
    }

    @Test("Throws error when fetching transactions by month fails") func getTransactionsByMonthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.transactions(budgetId: "budget_id", month: Date.now)
        }
    }

    @Test("Returns updated transaction when single update request succeeds") func updateTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let updateTransaction = SaveTransactionWithIdOrImportId(
            id: "transaction_id",
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedTransaction = TransactionDetail(
            id: "transaction_id",
            date: "2022-07-07",
            amount: 150,
            memo: "updated memo",
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            categoryName: "category_name",
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
        let expectedResponse = UpdateTransactionRequest.Response(
            transaction: expectedTransaction
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.updateTransaction(
            budgetId: "budget_id",
            transactionId: "transaction_id",
            transaction: updateTransaction
        )

        #expect(expectedTransaction == actualResponse)
    }

    @Test("Throws error when single transaction update fails") func updateTransactionThrowsErrorWhenRequestFails() async {
        let updateTransaction = SaveTransactionWithIdOrImportId(
            id: "transaction_id",
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateTransaction(
                budgetId: "budget_id",
                transactionId: "transaction_id",
                transaction: updateTransaction
            )
        }
    }

    // swiftlint:disable:next function_body_length
    @Test("Returns updated transactions when bulk update request succeeds") func updateTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let updateTransaction = SaveTransactionWithIdOrImportId(
            id: "transaction_id",
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedTransaction = TransactionDetail(
            id: "transaction_id",
            date: "2022-07-07",
            amount: 150,
            memo: "updated memo",
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            categoryName: "category_name",
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
        let expectedResponse = UpdateTransactionsRequest.Response(
            duplicateImportIds: [],
            serverKnowledge: 200,
            transactions: [expectedTransaction],
            transactionIds: ["transaction_id"]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.updateTransactions(
            budgetId: "budget_id",
            transactions: [updateTransaction]
        )

        #expect(actualResponse.0.count == 1)
        #expect(actualResponse.0[0] == expectedTransaction)
        #expect(actualResponse.1 == 200)
        #expect(actualResponse.2 == [])
    }

    @Test("Throws error when bulk transaction update fails") func updateTransactionsThrowsErrorWhenRequestFails() async {
        let updateTransaction = SaveTransactionWithIdOrImportId(
            id: "transaction_id",
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 150,
            payeeId: "payee_id",
            payeeName: "updated payee",
            categoryId: "category_id",
            memo: "updated memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateTransactions(
                budgetId: "budget_id",
                transactions: [updateTransaction]
            )
        }
    }

    @Test("Returns deleted transaction when delete request succeeds") func deleteTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let expectedTransaction = TransactionDetail(
            id: "transaction_id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
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
        let expectedResponse = DeleteTransactionRequest.Response(transaction: expectedTransaction)

        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.deleteTransaction(
            budgetId: "budget_id",
            transactionId: "transaction_id"
        )

        #expect(actualResponse == expectedTransaction)
    }

    @Test("Throws error when deleting a transaction fails") func deleteTransactionsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.deleteTransaction(
                budgetId: "budget_id",
                transactionId: "transaction_id"
            )
        }
    }

    // swiftlint:disable:next function_body_length
    @Test("Returns created transaction when single create request succeeds") func createTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let newTransaction = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedTransaction = TransactionDetail(
            id: "transaction_id",
            date: "2022-07-07",
            amount: 100,
            memo: "test memo",
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            categoryName: "category_name",
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
        let expectedResponse = CreateTransactionRequest.Response(
            serverKnowledge: 200,
            transaction: expectedTransaction,
            transactionIds: ["transaction_id"]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.createTransaction(
            budgetId: "budget_id",
            transaction: newTransaction
        )

        #expect(actualResponse.0 == expectedTransaction)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when single transaction creation fails") func createTransactionThrowsErrorWhenRequestFails() async {
        let newTransaction = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.createTransaction(
                budgetId: "budget_id",
                transaction: newTransaction
            )
        }
    }

    // swiftlint:disable:next function_body_length
    @Test("Returns created transactions when bulk create request succeeds") func createTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let newTransaction1 = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo 1",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let newTransaction2 = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2022-07-08",
            amount: 200,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo 2",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedTransaction1 = TransactionDetail(
            id: "transaction_id_1",
            date: "2022-07-07",
            amount: 100,
            memo: "test memo 1",
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            categoryName: "category_name",
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
        let expectedTransaction2 = TransactionDetail(
            id: "transaction_id_2",
            date: "2022-07-08",
            amount: 200,
            memo: "test memo 2",
            cleared: .cleared,
            approved: false,
            flagColor: nil,
            flagName: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            categoryName: "category_name",
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
        let expectedResponse = CreateTransactionsRequest.Response(
            duplicateImportIds: [],
            serverKnowledge: 200,
            transactions: [expectedTransaction1, expectedTransaction2],
            transactionIds: ["transaction_id_1", "transaction_id_2"]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.createTransactions(
            budgetId: "budget_id",
            transactions: [newTransaction1, newTransaction2]
        )

        #expect(actualResponse.0.count == 2)
        #expect(actualResponse.0[0] == expectedTransaction1)
        #expect(actualResponse.0[1] == expectedTransaction2)
        #expect(actualResponse.1 == 200)
        #expect(actualResponse.2 == [])
    }

    @Test("Throws error when bulk transaction creation fails") func createTransactionsThrowsErrorWhenRequestFails() async {
        let newTransaction = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2022-07-07",
            amount: 100,
            payeeId: "payee_id",
            payeeName: "test payee",
            categoryId: "category_id",
            memo: "test memo",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.createTransactions(
                budgetId: "budget_id",
                transactions: [newTransaction]
            )
        }
    }

    @Test("Returns transaction IDs when import request succeeds") func importTransactionsReturnsIdsWhenRequestSucceeds() async throws {
        let expectedResponse = ImportTransactionsRequest.Response(
            transactionIds: ["transaction_id_1", "transaction_id_2"]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.importTransactions(budgetId: "budget_id")

        #expect(actualResponse == ["transaction_id_1", "transaction_id_2"])
    }

    @Test("Throws error when importing transactions fails") func importTransactionsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.importTransactions(budgetId: "budget_id")
        }
    }
}
