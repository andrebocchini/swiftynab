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
    /// Retrieves a single account.
    ///
    /// - Parameters:
    ///    - planId: Id of the plan the account belongs to
    ///    - accountId: Id of the account to be retrieved
    ///
    /// - Returns: A single account
    public func account(planId: String, accountId: String) async throws -> Account {
        let request = AccountRequest(planId: planId, accountId: accountId)
        let response = try await client.perform(request)
        return response.account
    }

    /// Retrieves all accounts for a single plan.
    ///
    /// - Parameters:
    ///    - planId: Id of the plan the accounts belongs to
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of accounts and the last server knowledge
    public func accounts(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> (accounts: [Account], lastKnowledgeOfServer: ServerKnowledge) {
        let request = AccountsRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.accounts, response.serverKnowledge)
    }

    /// Creates a new unlinked account in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - name: The name of the new account
    ///    - type: The type of the new account
    ///    - balance: The initial balance of the new account in milliunits format
    ///
    /// - Returns: A single account
    public func newPlanAccount(
        planId: String,
        name: String,
        type: AccountType,
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
