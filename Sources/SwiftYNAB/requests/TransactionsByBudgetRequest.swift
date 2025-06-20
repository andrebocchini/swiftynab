//
//  TransactionsByBudgetRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByBudgetRequest {
    let budgetId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        budgetId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.budgetId = budgetId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByBudgetRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension TransactionsByBudgetRequest {
    struct Response: Decodable {
        let transactions: [TransactionDetail]
        let serverKnowledge: ServerKnowledge
    }
}
