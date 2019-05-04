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
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String, lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension MonthsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/months"
    }
    
    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer = self.lastKnowledgeOfServer else {
            return nil
        }
        
        return [URLQueryItem(name: "last_knowledge_of_server",
                             value: "\(lastKnowledgeOfServer)")]
    }
    
}


struct MonthRequest {
    
    let budgetId: String
    let month: String
    
}

extension MonthRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/months/\(self.month)"
    }
    
}
