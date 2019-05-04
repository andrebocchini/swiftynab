//
//  ScheduledTransactionDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Full details of a scheduled transaction
public struct ScheduledTransactionDetail: Codable {
    
    /// Transaction id
    public let id: String
    
    /// First occurence of this transaction
    public let dateFirst: String
    
    /// Date of next occurrence
    public let dateNext: String
    
    /// How often the transaction happens
    public let frequency: String
    
    /// Amount of the transaction in milliunits
    public let amount: Int
    
    /// Transaction memo
    public let memo: String?
    
    /// Flag color
    public let flagColor: String?
    
    /// Account id
    public let accountId: String
    
    /// Account name
    public let accountName: String
    
    /// Payee id
    public let payeeId: String
    
    /// Payee name
    public let payeeName: String
    
    /// Category id
    public let categoryId: String?
    
    /// Category name
    public let categoryName: String?
    
    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?
    
    /// Whether or not the transaction has been deleted
    public let deleted: Bool
    
    /// Sub transactions associated with this transaction
    public let subtransactions: [ScheduledSubTransaction]
    
}
