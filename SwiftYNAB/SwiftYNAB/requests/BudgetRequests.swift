//
//  BudgetRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct BudgetSummaryRequest {
    
}

extension BudgetSummaryRequest: Request {
    
    var path: String {
        return "/v1/budgets"
    }
    
}


struct BudgetSettingsRequest {
    
    let budgetId: String
    
}

extension BudgetSettingsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/settings"
    }
    
}


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
        return "/v1/budgets/\(self.budgetId)"
    }
    
    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer = self.lastKnowledgeOfServer else {
            return nil
        }
        
        return [URLQueryItem(name: "last_knowledge_of_server",
                             value: "\(lastKnowledgeOfServer)")]
    }
    
}
