//
//  AccountService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to account operations
public struct AccountService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension AccountService: AccountServiceType {
    public func account(planId: String, accountId: String) async throws -> Account {
        let request = AccountRequest(planId: planId, accountId: accountId)
        let response = try await client.perform(request)
        return response.account
    }

    public func accounts(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> AccountsResponse {
        let request = AccountsRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return AccountsResponse(
            accounts: response.accounts,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func newPlanAccount(
        planId: String,
        name: String,
        type: SaveAccountType,
        balance: Int
    ) async throws -> Account {
        let request = NewPlanAccountRequest(
            planId: planId,
            name: name,
            type: type,
            balance: balance
        )
        let response = try await client.perform(request)
        return response.account
    }
}
