//
//  Account.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget account model
public struct Account: Codable {
    
    /// Account id
    public let id: String
    
    /// Account name
    public let name: String
    
    /// Account type
    public let type: String
    
    /// Budget account or not
    public let onBudget: Bool
    
    /// Closed account or not
    public let closed: Bool
    
    /// Note on the account
    public let note: String?
    
    /// Account balance
    public let balance: Int
    
    /// Cleared account balance
    public let clearedBalance: Int
    
    /// Uncleared account balance
    public let unclearedBalance: Int
    
    /// Payee id for transfers
    public let transferPayeeId: String
    
    /// Deleted account or not
    public let deleted: Bool
    
}
