//
//  YNAB.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// YNAB API client
public class YNAB {
    
    private let accessToken: String
    
    private lazy var client = Client(accessToken: self.accessToken)
    
    /// Provides access to user operations
    public lazy var users = UserService(with: self.client)
    
    /// Provides access to budget operations
    public lazy var budgets = BudgetService(with: self.client)
    
    /// Provides access to account operations
    public lazy var accounts = AccountService(with: self.client)

    /// Provides access to category operations
    public lazy var categories = CategoryService(with: self.client)

    /// Provides access to payee operations
    public lazy var payees = PayeeService(with: self.client)

    /// Provides access to payee location operations
    public lazy var payeeLocations = PayeeLocationService(with: self.client)

    /// Provides access to month operations
    public lazy var months = MonthService(with: self.client)

    /// Provides access to transaction operations
    public lazy var transactions = TransactionService(with: self.client)

    /// Provides access to scheduled transaction operations
    public lazy var scheduledTransactions = ScheduledTransactionService(with: self.client)

    /**
     Initializes the YNAB API client
     
     - Parameters:
     - accessToken: Personal API access token, or token obtained via OAuth login
    */
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
    
}
