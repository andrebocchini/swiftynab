//
//  BudgetDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Full budget model. This represents a complete budget export.
public struct BudgetDetail: Codable, Equatable {
    /// Budget id
    public let id: String

    /// Budget name
    public let name: String

    /// Date the budget was last modified
    public let lastModifiedOn: String

    /// Date formatting settings
    public let dateFormat: DateFormat?

    /// Currency formatting settings
    public let currencyFormat: CurrencyFormat?

    /// Budget's first month
    public let firstMonth: String

    /// Budget's last month
    public let lastMonth: String

    /// Accounts on this budget
    public let accounts: [Account]

    /// Payees on this budget
    public let payees: [Payee]

    /// All recorded payee locations
    public let payeeLocations: [PayeeLocation]

    /// Budget category groups
    public let categoryGroups: [CategoryGroup]

    /// Budget categories
    public let categories: [Category]

    /// Budget months
    public let months: [MonthDetail]

    /// All transactions on this budget
    public let transactions: [TransactionSummary]

    /// All subtransactions on this budget
    public let subtransactions: [SubTransaction]

    /// All scheduled transactions on this budget
    public let scheduledTransactions: [ScheduledTransactionSummary]

    /// All scheduled sub transactions on this budget
    public let scheduledSubtransactions: [ScheduledSubTransaction]
}
