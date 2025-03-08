//
//  MonthsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct MonthsRequest {
    let budgetId: String
    let lastKnowledgeOfServer: ServerKnowledge?

    init(budgetId: String, lastKnowledgeOfServer: ServerKnowledge? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension MonthsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/months"
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
