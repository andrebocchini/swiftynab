//
//  TransactionDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Detailed model of a transaction
public struct TransactionDetail: Codable {
    
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
    
    /// Name of the account this transaction belongs to
    public let accountName: String
    
    /// Payee id
    public let payeeId: String?
    
    /// Payee name
    public let payeeName: String?
    
    /// Category id
    public let categoryId: String?
    
    /// Category name
    public let categoryName: String?
    
    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?
    
    /// If it's a transfer transaction, the id of the transfer
    public let transferTransactionId: String?
    
    /// If it's an imported transaction, the id of the matched transaction
    public let matchedTransactionId: String?
    
    /// Import id
    public let importId: String?
    
    /// Whether or not the transaction has been deleted
    public let deleted: Bool
    
    /// Sub transactions belonging to this transaction
    public let subtransactions: [SubTransaction]
    
}
