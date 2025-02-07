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

        XCTAssertEqual(expectedAccount, actualResponse)
    }

    func testGeAccountThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.account(budgetId: "budget_id", accountId: "account_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testAccountsReturnsAccountsWhenRequestSucceeds() async throws {
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

        XCTAssertEqual(actualResponse.accounts.count, 1)
        XCTAssertEqual(expectedAccount, actualResponse.accounts[0])
    }

    func testGeAccountsThrowsHttpErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.accounts(budgetId: "budget_id", lastKnowledgeOfServer: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGeAccountsThrowsApiErrorWhenRequestFails() async throws {
        let errorDetails = ErrorDetail(
            id: "403.2",
            name: "trial_expired",
            detail: "The trial for this account has expired"
        )
        let expectedError = SwiftYNABError.apiError(detail: errorDetails)
        let client = MockFailureClient(expectedError: expectedError)
        let service = AccountService(client: client)

        do {
            _ = try await service.accounts(budgetId: "budget_id", lastKnowledgeOfServer: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .apiError(detail: errorDetails))
        }
    }

    func testNewBudgetAccountsReturnsAccountsWhenRequestSucceeds() async throws {
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
                type: .checking,
                balance: 0
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
