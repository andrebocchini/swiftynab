//
//  AccountServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol AccountServiceType: Sendable {
    func account(budgetId: String, accountId: String) async throws -> Account

    func accounts(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> (accounts: [Account], lastKnowledgeOfServer: ServerKnowledge)

    func newBudgetAccount(
        budgetId: String,
        name: String,
        type: AccountType,
        balance: Int
    ) async throws -> Account
}
