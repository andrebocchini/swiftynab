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
