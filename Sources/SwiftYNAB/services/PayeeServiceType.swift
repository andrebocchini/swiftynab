//
//  PayeeServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PayeeServiceType: Sendable {
    func payees(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws
        -> [Payee]

    func payee(planId: String, payeeId: String) async throws -> Payee

    func updatePayee(
        planId: String,
        payeeId: String,
        payee: SavePayee
    ) async throws -> (Payee, ServerKnowledge)
}
