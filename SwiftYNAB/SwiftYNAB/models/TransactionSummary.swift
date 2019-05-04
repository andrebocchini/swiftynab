//
//  TransactionSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Summary details of a transaction
public struct TransactionSummary: Codable {
    
    /// Transaction id
    public let id: String

    /// Transaction date
    public let date: String
    
    /// Amount of the transaction in milliunits
    public let amount: Int
    
    /// Transaction memo
    public let memo: String?
    
    /// Whether or not the transaction has been cleared
    public let cleared: String
    
    /// Whether or not the transaction has been approved
    public let approved: Bool
    
    /// Flag color
    public let flagColor: String?
    
    /// Id of the account this transaction belongs to
    public let accountId: String
    
    /// Payee id
    public let payeeId: String
    
    /// Category id
    public let categoryId: String?
    
    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?
    
    /// If it's a transfer transaction, the transfer transaction id
    public let transferTransactionId: String?

    /// Import id
    public let importId: String?
    
    /// Whether or not the transaction has been deleted
    public let deleted: Bool
    
}
