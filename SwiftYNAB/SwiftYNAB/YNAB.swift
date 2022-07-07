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
    private let client: ClientType

    /// Provides access to user operations
    public lazy var users = UserService(client: client)

    /// Provides access to budget operations
    public lazy var budgets = BudgetService(client: client)

    /// Provides access to account operations
    public lazy var accounts = AccountService(client: client)

    /// Provides access to category operations
    public lazy var categories = CategoryService(client: client)

    /// Provides access to payee operations
    public lazy var payees = PayeeService(client: client)

    /// Provides access to payee location operations
    public lazy var payeeLocations = PayeeLocationService(client: client)

    /// Provides access to month operations
    public lazy var months = MonthService(client: client)

    /// Provides access to transaction operations
    public lazy var transactions = TransactionService(client: client)

    /// Provides access to scheduled transaction operations
    public lazy var scheduledTransactions = ScheduledTransactionService(client: client)

    /// Initializes the YNAB API client
    ///
    /// - Parameters:
    ///    - accessToken: Personal API access token, or token obtained via OAuth login
    ///    - urlSession: By default, it uses the default `URLSession.shared`, but allows the injection of a custom session
    public init(accessToken: String, urlSession: URLSession = .shared) {
        self.client = Client(
            accessToken: accessToken,
            urlSession: urlSession,
            serializer: Serializer.shared
        )
    }
}
