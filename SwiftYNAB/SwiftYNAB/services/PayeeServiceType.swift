//
//  PayeeServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PayeeServiceType {
    func getPayees(budgetId: String, lastKnowledgeOfServer: ServerKnowledge?) async throws -> [Payee]

    func getPayee(budgetId: String, payeeId: String) async throws -> Payee
}
