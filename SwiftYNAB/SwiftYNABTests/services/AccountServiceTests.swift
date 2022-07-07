//
//  AccountServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class AccountServiceTests: XCTestCase {
    func testGetAccountReturnsAccountWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "name",
            type: "checking",
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            deleted: false
        )
        let expectedResponse = AccountResponse(account: expectedAccount)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.getAccount(
            budgetId: "budget_id",
            accountId: "account_id"
        )

        XCTAssertEqual(expectedAccount, actualResponse)
    }

    func testGeAccountThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.getAccount(budgetId: "budget_id", accountId: "account_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testAccountsReturnsAccountsWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "name",
            type: "checking",
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            deleted: false
        )
        let expectedResponse = AccountsResponse(accounts: [expectedAccount], serverKnowledge: 2)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.getAccounts(
            budgetId: "budget_id",
            lastKnowledgeOfServer: 1
        )

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedAccount, actualResponse[0])
    }

    func testGeAccountsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.getAccounts(budgetId: "budget_id", lastKnowledgeOfServer: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testNewBudgetAccountsReturnsAccountsWhenRequestSucceeds() async throws {
        let expectedAccount = Account(
            id: "account_id",
            name: "account",
            type: "checking",
            onBudget: true,
            closed: false,
            note: nil,
            balance: 0,
            clearedBalance: 0,
            unclearedBalance: 0,
            transferPayeeId: "payeed_id",
            deleted: false
        )
        let expectedResponse = AccountResponse(account: expectedAccount)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = AccountService(client: client)
        let actualResponse = try await service.newBudgetAccount(
            budgetId: "budget_id",
            name: "account",
            type: "checking",
            balance: 0
        )

        XCTAssertEqual(expectedAccount, actualResponse)
    }

    func testNewBudgetAccountThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.newBudgetAccount(
                budgetId: "budget_id",
                name: "account",
                type: "checking",
                balance: 0
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
