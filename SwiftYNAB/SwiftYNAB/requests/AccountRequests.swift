//
//  AccountRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct AccountsRequest {
    
    let budgetId: String
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String, lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension AccountsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(budgetId)/accounts"
    }
    
    var query: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()

        if let lastKnowledgeOfServer = self.lastKnowledgeOfServer {
            queryItems.append(URLQueryItem(name: "last_knowledge_of_server",
                                           value: String(lastKnowledgeOfServer)))
        }
        
        return queryItems.count > 0 ? queryItems : nil
    }
    
}


struct AccountRequest {
    
    let budgetId: String
    let accountId: String
    
}

extension AccountRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(budgetId)/accounts/\(accountId)"
    }
    
}
