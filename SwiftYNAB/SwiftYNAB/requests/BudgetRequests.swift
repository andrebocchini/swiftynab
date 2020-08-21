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


struct NewBudgetAccountRequest {
    
    let budgetId: String
    let name: String
    let type: String
    let balance: Int
    
    init(budgetId: String, name: String, type: String, balance: Int) {
        self.budgetId = budgetId
        self.name = name
        self.type = type
        self.balance = balance
    }
    
}

extension NewBudgetAccountRequest: Request {
    
    var method: String {
        return "POST"
    }
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/accounts"
    }
    
    var body: Data? {
        let body = NewBudgetAccountRequestBody(name: self.name, type: self.type, balance: self.balance)
        let wrapper = NewBudgetAccountRequestWrapper(account: body)
        return try? Serializer.encode(wrapper)
    }
        
}
