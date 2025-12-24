//
//  TransactionServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

// swiftlint:disable:next type_body_length
class TransactionServiceTests: XCTestCase {
    func testGetTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(expectedTransaction, actualResponse.0)
        XCTAssertEqual(200, actualResponse.1)
    }

    func testGetTransactionThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transaction(budgetId: "budget_id", transactionId: "id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetTransactionsByBudgetReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetTransactionsByBudgetThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transactions(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetTransactionsByAccountReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetTransactionsByAccountThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transactions(budgetId: "budget_id", accountId: "account_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetTransactionsByCategoryReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetTransactionsByCategoryThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transactions(budgetId: "budget_id", categoryId: "category_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetTransactionsByPayeeReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetTransactionsByPayeeThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transactions(budgetId: "budget_id", payeeId: "payee_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetTransactionsByMonthReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetTransactionsByMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.transactions(budgetId: "budget_id", month: Date.now)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdateTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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
            transaction: updateTransaction
        )

        XCTAssertEqual(expectedTransaction, actualResponse)
    }

    func testUpdateTransactionThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.updateTransaction(
                budgetId: "budget_id",
                transaction: updateTransaction
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // swiftlint:disable:next function_body_length
    func testUpdateTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(actualResponse.0[0], expectedTransaction)
        XCTAssertEqual(actualResponse.1, 200)
        XCTAssertEqual(actualResponse.2, [])
    }

    func testUpdateTransactionsThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.updateTransactions(
                budgetId: "budget_id",
                transactions: [updateTransaction]
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testDeleteTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse, expectedTransaction)
    }

    func testDeleteTransactionsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.deleteTransaction(
                budgetId: "budget_id",
                transactionId: "transaction_id"
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // swiftlint:disable:next function_body_length
    func testCreateTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0, expectedTransaction)
        XCTAssertEqual(actualResponse.1, 200)
    }

    func testCreateTransactionThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.createTransaction(
                budgetId: "budget_id",
                transaction: newTransaction
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    // swiftlint:disable:next function_body_length
    func testCreateTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.0.count, 2)
        XCTAssertEqual(actualResponse.0[0], expectedTransaction1)
        XCTAssertEqual(actualResponse.0[1], expectedTransaction2)
        XCTAssertEqual(actualResponse.1, 200)
        XCTAssertEqual(actualResponse.2, [])
    }

    func testCreateTransactionsThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.createTransactions(
                budgetId: "budget_id",
                transactions: [newTransaction]
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testImportTransactionsReturnsIdsWhenRequestSucceeds() async throws {
        let expectedResponse = ImportTransactionsRequest.Response(
            transactionIds: ["transaction_id_1", "transaction_id_2"]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.importTransactions(budgetId: "budget_id")

        XCTAssertEqual(actualResponse, ["transaction_id_1", "transaction_id_2"])
    }

    func testImportTransactionsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.importTransactions(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
