//
//  ScheduledSubTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Scheduled sub transaction
public struct ScheduledSubTransaction: Codable {
    
    /// Transaction id
    public let id: String
    
    /// Id of the scheduled transaction this sub transaction belongs to
    public let scheduledTransactionId: String
    
    /// Transaction amount
    public let amount: Int
    
    /// Transaction memo
    public let memo: String?
    
    /// Payee id
    public let payeeId: String?
    
    /// Category id
    public let categoryId: String?
    
    /// Transfer account id
    public let transferAccountId: String?
    
    /// Whether or not the account is deleted
    public let deleted: Bool
    
}
