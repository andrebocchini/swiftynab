//
//  ScheduledTransactionsRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct ScheduledTransactionRequest {
    
    let budgetId: String
    let transactionId: String
    
}

extension ScheduledTransactionRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/scheduled_transactions/\(self.transactionId)"
    }
    
}


struct ScheduledTransactionsRequest {
    
    let budgetId: String
    
}

extension ScheduledTransactionsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/scheduled_transactions"
    }
    
}
