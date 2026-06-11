//
//  YNAB.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

/// YNAB API client
public struct YNAB {
    private let client: ClientType

    /// Provides access to user operations
    public let users: any UserServiceType

    /// Provides access to plan operations
    public let plans: any PlanServiceType

    /// Provides access to account operations
    public let accounts: any AccountServiceType

    /// Provides access to category operations
    public let categories: any CategoryServiceType

    /// Provides access to payee operations
    public let payees: any PayeeServiceType

    /// Provides access to payee location operations
    public let payeeLocations: any PayeeLocationServiceType

    /// Provides access to month operations
    public let months: any MonthServiceType

    /// Provides access to transaction operations
    public let transactions: any TransactionServiceType

    /// Provides access to scheduled transaction operations
    public let scheduledTransactions: any ScheduledTransactionServiceType

    /// Provides access to money movement operations
    public let moneyMovements: any MoneyMovementServiceType

    /// Initializes the YNAB API client
    ///
    /// - Parameters:
    ///    - accessToken: Personal API access token, or token obtained via OAuth login
    ///    - urlSession: By default, it uses the default `URLSession.shared`, but allows the
    /// injection of a custom session
    public init(accessToken: String, urlSession: URLSession = .shared) {
        let client = Client(
            accessToken: accessToken,
            urlSession: urlSession,
            serializer: Serializer()
        )
        self.client = client
        users = UserService(client: client)
        plans = PlanService(client: client)
        accounts = AccountService(client: client)
        categories = CategoryService(client: client)
        payees = PayeeService(client: client)
        payeeLocations = PayeeLocationService(client: client)
        months = MonthService(client: client)
        transactions = TransactionService(client: client)
        scheduledTransactions = ScheduledTransactionService(client: client)
        moneyMovements = MoneyMovementService(client: client)
    }
}
