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
    ///    - budgetId: Id of the budget the account belongs to
    ///    - accountId: Id of the account to be retrieved
    ///
    /// - Returns: A single account
    public func account(budgetId: String, accountId: String) async throws -> Account {
        let request = AccountRequest(budgetId: budgetId, accountId: accountId)
        let response = try await client.perform(request)
        return response.account
    }

    /// Retrieves all accounts for a single budget.
    ///
    /// - Parameters:
    ///    - budgetId: Id of the budget the accounts belongs to
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of accounts and the last server knowledge
    public func accounts(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> (accounts: [Account], lastKnowledgeOfServer: ServerKnowledge) {
        let request = AccountsRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.accounts, response.serverKnowledge)
    }

    /// Creates a new unlinked account in a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - name: The name of the new account
    ///    - type: The type of the new account
    ///    - balance: The initial balance of the new account in milliunits format
    ///
    /// - Returns: A single account
    public func newBudgetAccount(
        budgetId: String,
        name: String,
        type: AccountType,
        balance: Int
    ) async throws -> Account {
        let request = NewBudgetAccountRequest(
            budgetId: budgetId,
            name: name,
            type: type,
            balance: balance
        )
        let response = try await client.perform(request)
        return response.account
    }
}
