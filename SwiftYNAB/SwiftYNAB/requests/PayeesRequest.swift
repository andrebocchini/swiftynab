//
//  PayeesRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeesRequest {
    let budgetId: String
    let lastKnowledgeOfServer: Int?

    init(budgetId: String, lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension PayeesRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payees"
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
