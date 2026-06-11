//
//  AccountServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to account operations
public protocol AccountServiceType: Sendable {
    /// Retrieves a single account.
    ///
    /// - Parameters:
    ///    - planId: Id of the plan the account belongs to
    ///    - accountId: Id of the account to be retrieved
    ///
    /// - Returns: A single account
    func account(planId: String, accountId: String) async throws -> Account

    /// Retrieves all accounts for a single plan.
    ///
    /// - Parameters:
    ///    - planId: Id of the plan the accounts belongs to
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of accounts and the knowledge of the server
    func accounts(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> AccountsResponse

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
    func newPlanAccount(
        planId: String,
        name: String,
        type: SaveAccountType,
        balance: Int
    ) async throws -> Account
}

public extension AccountServiceType {
    /// Retrieves all accounts for a single plan, with optional parameters defaulted.
    func accounts(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> AccountsResponse {
        try await accounts(planId: planId, lastKnowledgeOfServer: lastKnowledgeOfServer)
    }
}
