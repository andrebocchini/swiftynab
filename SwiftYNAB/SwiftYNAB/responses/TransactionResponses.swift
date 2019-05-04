//
//  TransactionResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionResponse: Codable {
    
    let data: TransactionResponseWrapper
    
    struct TransactionResponseWrapper: Codable {
        
        let transaction: TransactionDetail
        
    }
    
}


struct TransactionsResponse: Codable {
    
    let data: TransactionsWrapper
    
    struct TransactionsWrapper: Codable {
        
        let transactions: [TransactionDetail]
        let serverKnowledge: Int
        
    }
    
}


struct SaveTransactionResponse: Codable {
    
    let data: SaveTransactionResponseWrapper
    
    struct SaveTransactionResponseWrapper: Codable {
        
        let transactionIds: [String]
        let transaction: TransactionDetail
        
    }
    
}


struct SaveTransactionsResponse: Codable {
    
    let data: SaveTransactionsResponseWrapper
    
    struct SaveTransactionsResponseWrapper: Codable {
        
        let transactionIds: [String]
        let duplicateImportIds: [String]
        let transactions: [TransactionDetail]
        
    }
    
}


struct HybridTransactionsResponse: Codable {
    
    let data: HybridTransactionsWrapper
    
    struct HybridTransactionsWrapper: Codable {
        
        let transactions: [HybridTransaction]
        
    }
    
}
