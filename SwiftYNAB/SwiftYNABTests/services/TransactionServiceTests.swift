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

class TransactionServiceTests: XCTestCase {
    func testGetTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = TransactionResponse(transaction: expectedTransaction)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.getTransaction(
            budgetId: "budget_id",
            transactionId: "id"
        )

        XCTAssertEqual(expectedTransaction, actualResponse)
    }

    func testGetTransactionThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.getTransaction(budgetId: "budget_id", transactionId: "id")
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
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = TransactionsResponse(
            transactions: [expectedTransaction],
            serverKnowledge: 1
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.getTransactions(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedTransaction, actualResponse[0])
    }

    func testGetTransactionsByBudgetThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.getTransactions(budgetId: "budget_id")
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
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = TransactionsResponse(
            transactions: [expectedTransaction],
            serverKnowledge: 1
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.getTransactions(
            budgetId: "budget_id",
            accountId: "account_id"
        )

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedTransaction, actualResponse[0])
    }

    func testGetTransactionsByAccountThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.getTransactions(budgetId: "budget_id", accountId: "account_id")
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
            cleared: "cleared",
            approved: false,
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: nil,
            payeeName: nil,
            categoryId: "category_id",
            transferAccountId: nil,
            transferTransactionId: nil,
            matchedTransactionId: nil,
            importId: nil,
            deleted: false
        )
        let expectedResponse = HybridTransactionsResponse(transactions: [expectedTransaction])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.getTransactions(
            budgetId: "budget_id",
            categoryId: "category_id"
        )

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedTransaction, actualResponse[0])
    }

    func testGetTransactionsByCategoryThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.getTransactions(budgetId: "budget_id", categoryId: "category_id")
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
            cleared: "cleared",
            approved: false,
            flagColor: nil,
            accountId: "account_id",
            accountName: "account_name",
            payeeId: "payee_id",
            payeeName: nil,
            categoryId: "category_id",
            transferAccountId: nil,
            transferTransactionId: nil,
            matchedTransactionId: nil,
            importId: nil,
            deleted: false
        )
        let expectedResponse = HybridTransactionsResponse(transactions: [expectedTransaction])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.getTransactions(
            budgetId: "budget_id",
            payeeId: "payee_id"
        )

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedTransaction, actualResponse[0])
    }

    func testGetTransactionsByPayeeThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.getTransactions(budgetId: "budget_id", payeeId: "payee_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testSaveTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let newTransaction = NewTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveTransactionResponse(
            transactionIds: ["id"],
            transaction: expectedTransaction
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.saveTransaction(
            budgetId: "budget_id",
            transaction: newTransaction
        )

        XCTAssertEqual(expectedTransaction, actualResponse)
    }

    func testSaveTransactionThrowsErrorWhenRequestFails() async throws {
        let newTransaction = NewTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.saveTransaction(
                budgetId: "budget_id",
                transaction: newTransaction
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testSaveTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let newTransaction = NewTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveTransactionsResponse(
            transactionIds: ["id"],
            duplicateImportIds: [],
            transactions: [expectedTransaction]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.saveTransactions(
            budgetId: "budget_id",
            transactions: [newTransaction]
        )

        XCTAssertEqual(actualResponse.transactions, [expectedTransaction])
        XCTAssertEqual(actualResponse.transactionIds, ["id"])
        XCTAssertEqual(actualResponse.duplicateImportIds, [])
    }

    func testSaveTransactionsThrowsErrorWhenRequestFails() async throws {
        let newTransaction = NewTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = TransactionService(client: client)

        do {
            _ = try await service.saveTransactions(
                budgetId: "buddget_id",
                transactions: [newTransaction]
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdateTransactionReturnsTransactionWhenRequestSucceeds() async throws {
        let updateTransaction = UpdateTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveTransactionResponse(
            transactionIds: ["id"],
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
        let updateTransaction = UpdateTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
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

    func testUpdateTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
        let updateTransaction = UpdateTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
        )
        let expectedTransaction = TransactionDetail(
            id: "id",
            date: "2022-07-07",
            amount: 0,
            memo: nil,
            cleared: "cleared",
            approved: false,
            flagColor: nil,
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
            deleted: false,
            subtransactions: []
        )
        let expectedResponse = SaveTransactionsResponse(
            transactionIds: ["id"],
            duplicateImportIds: [],
            transactions: [expectedTransaction]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = TransactionService(client: client)
        let actualResponse = try await service.updateTransactions(
            budgetId: "budget_id",
            transactions: [updateTransaction]
        )

        XCTAssertEqual(actualResponse.transactions, [expectedTransaction])
        XCTAssertEqual(actualResponse.transactionIds, ["id"])
        XCTAssertEqual(actualResponse.duplicateImportIds, [])
    }

    func testUpdateTransactionsThrowsErrorWhenRequestFails() async throws {
        let updateTransaction = UpdateTransaction(
            date: "2022-07-07",
            amount: 0,
            accountId: "account_id",
            payeeId: "payee_id",
            payeeName: "payee_name"
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
}
