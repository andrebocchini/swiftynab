//
//  BudgetDetailRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct BudgetDetailRequest {
    let budgetId: String
    let lastKnowledgeOfServer: Int?

    init(budgetId: String, lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension BudgetDetailRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)"
    }

    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer = lastKnowledgeOfServer else {
            return nil
        }

        return [URLQueryItem(
            name: "last_knowledge_of_server",
            value: "\(lastKnowledgeOfServer)"
        )]
    }
}
