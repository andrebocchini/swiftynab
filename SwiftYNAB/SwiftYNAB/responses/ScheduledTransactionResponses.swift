//
//  ScheduledTransactionResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct ScheduledTransactionResponse: Codable {
    
    let data: ScheduledTransactionWrapper
    
    struct ScheduledTransactionWrapper: Codable {
        
        let scheduledTransaction: ScheduledTransactionDetail
        
    }
    
}


struct ScheduledTransactionsResponse: Codable {
    
    let data: ScheduledTransactionsWrapper
    
    struct ScheduledTransactionsWrapper: Codable {
        
        let scheduledTransactions: [ScheduledTransactionDetail]
        
    }
    
}
