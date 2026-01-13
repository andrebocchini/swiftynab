//
//  ScheduledTransactionServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

// swiftlint:disable:next type_body_length
class ScheduledTransactionServiceTests: XCTestCase {
    func testGetScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(expectedTransaction, actualResponse)
    }

    func testGetScheduledTransactionThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        do {
            _ = try await service.scheduledTransaction(
                budgetId: "budget_id",
                transactionId: "1234"
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetScheduledTransactionsReturnsTransactionsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(expectedTransaction, transactions.first)
        XCTAssertEqual(serverKnowledge, 1)
    }

    func testGetScheduledTransactionsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        do {
            _ = try await service.scheduledTransactions(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testCreateScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(expectedScheduledTransaction, actualResponse)
    }

    func testCreateScheduledTransactionThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.createScheduledTransaction(
                budgetId: "budget_id",
                transaction: newScheduledTransaction
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdateScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(expectedScheduledTransaction, actualResponse)
    }

    func testUpdateScheduledTransactionThrowsErrorWhenRequestFails() async throws {
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

        do {
            _ = try await service.updateScheduledTransaction(
                budgetId: "budget_id",
                transactionId: "scheduled_transaction_id",
                transaction: updateScheduledTransaction
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testDeleteScheduledTransactionReturnsTransactionWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(expectedScheduledTransaction, actualResponse)
    }

    func testDeleteScheduledTransactionThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        do {
            _ = try await service.deleteScheduledTransaction(
                budgetId: "budget_id",
                transactionId: "scheduled_transaction_id"
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
