//
//  SubTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Subtransaction model
public struct SubTransaction: Codable {
    
    /// Sub transaction id
    public let id: String
    
    /// Id of the transaction this sub transaction belongs to
    public let transactionId: String
    
    /// Amount of the transaction in milliunits
    public let amount: Int
    
    /// Transaction memo
    public let memo: String?
    
    /// Payee id
    public let payeeId: String?
    
    /// Category id
    public let categoryId: String?
    
    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?
    
    /// Whether or not the transaction has been deleted
    public let deleted: Bool
    
}
