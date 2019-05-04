//
//  HybridTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Hybrid transaction
public struct HybridTransaction: Codable {
    
    /// Transaction type
    public let type: String
    
    /// Id of the parent transaction
    public let parentTransactionId: String?
    
    /// Transaction id
    public let id: String
    
    /// Transaction date
    public let date: String
    
    /// Transaction amount
    public let amount: Int
    
    /// Transaction memo
    public let memo: String?
    
    /// Whether or not the transaction is cleared
    public let cleared: String
    
    /// Where or not the transaction is approved
    public let approved: Bool
    
    /// Flag color
    public let flagColor: String?
    
    /// Account id
    public let accountId: String
    
    /// Account name
    public let accountName: String
    
    /// Payee id
    public let payeeId: String?
    
    /// Payee name
    public let payeeName: String?
    
    /// Category id
    public let categoryId: String
    
    /// Transfer account id
    public let transferAccountId: String?
    
    /// Transfer transaction id
    public let transferTransactionId: String?
    
    /// Matched transaction id
    public let matchedTransactionId: String?
    
    /// Import id
    public let importId: String?
    
    /// Whether or not the transaction is deleted
    public let deleted: Bool
    
}
