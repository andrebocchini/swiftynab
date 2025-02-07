//
//  AccountsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct AccountsRequest {
    let budgetId: String
    let lastKnowledgeOfServer: ServerKnowledge?

    init(budgetId: String, lastKnowledgeOfServer: ServerKnowledge? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension AccountsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/accounts"
    }

    var query: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()

        if let lastKnowledgeOfServer {
            queryItems.append(URLQueryItem(
                name: "last_knowledge_of_server",
                value: String(lastKnowledgeOfServer)
            ))
        }

        return !queryItems.isEmpty ? queryItems : nil
    }
}

extension AccountsRequest {
    struct Response: Decodable {
        let accounts: [Account]
        let serverKnowledge: ServerKnowledge
    }
}
