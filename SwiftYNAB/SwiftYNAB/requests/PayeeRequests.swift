//
//  PayeeRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
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
        return "/v1/budgets/\(self.budgetId)/payees"
    }
    
    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer = self.lastKnowledgeOfServer else {
            return nil
        }
        
        return [URLQueryItem(name: "last_knowledge_of_server",
                             value: "\(lastKnowledgeOfServer)")]
    }
    
}


struct PayeeRequest {
    
    let budgetId: String
    let payeeId: String
    
}

extension PayeeRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/payees/\(self.payeeId)"
    }
    
}
