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
            ScheduledTransactionResponse(scheduledTransaction: expectedTransaction)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.getScheduledTransaction(
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
            _ = try await service.getScheduledTransaction(
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
        let expectedResponse = ScheduledTransactionsResponse(
            scheduledTransactions: [expectedTransaction]
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = ScheduledTransactionService(client: client)
        let actualResponse = try await service.getScheduledTransactions(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedTransaction, actualResponse[0])
    }

    func testGetScheduledTransactionsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = ScheduledTransactionService(client: client)

        do {
            _ = try await service.getScheduledTransactions(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
