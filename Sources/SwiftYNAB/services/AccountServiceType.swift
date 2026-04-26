//
//  AccountServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol AccountServiceType: Sendable {
    func account(planId: String, accountId: String) async throws -> Account

    func accounts(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> (accounts: [Account], lastKnowledgeOfServer: ServerKnowledge)

    func newPlanAccount(
        planId: String,
        name: String,
        type: SaveAccountType,
        balance: Int
    ) async throws -> Account
}
