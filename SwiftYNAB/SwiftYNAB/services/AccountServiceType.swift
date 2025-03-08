//
//  AccountServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol AccountServiceType {
    func getAccount(budgetId: String, accountId: String) async throws -> Account

    func getAccounts(budgetId: String, lastKnowledgeOfServer: ServerKnowledge?) async throws -> [Account]

    func newBudgetAccount(budgetId: String, name: String, type: String, balance: Int) async throws
        -> Account
}
