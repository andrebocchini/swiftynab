//
//  PlanDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Full plan model. This represents a complete plan export.
public struct PlanDetail: Codable, Equatable, Sendable {
    /// Plan id
    public let id: String

    /// Plan name
    public let name: String

    /// Date the plan was last modified
    public let lastModifiedOn: String?

    /// Plan's first month
    public let firstMonth: String?

    /// Plan's last month
    public let lastMonth: String?

    /// Date formatting settings
    public let dateFormat: DateFormat?

    /// Currency formatting settings
    public let currencyFormat: CurrencyFormat?

    /// Accounts on this plan
    public let accounts: [Account]?

    /// Payees on this plan
    public let payees: [Payee]?

    /// All recorded payee locations
    public let payeeLocations: [PayeeLocation]?

    /// Plan category groups
    public let categoryGroups: [CategoryGroup]?

    /// Plan categories
    public let categories: [Category]?

    /// Plan months
    public let months: [MonthDetail]?

    /// All transactions on this plan
    public let transactions: [TransactionSummary]?

    /// All subtransactions on this plan
    public let subtransactions: [SubTransaction]?

    /// All scheduled transactions on this plan
    public let scheduledTransactions: [ScheduledTransactionSummary]?

    /// All scheduled sub transactions on this plan
    public let scheduledSubtransactions: [ScheduledSubTransaction]?

    public init(
        id: String,
        name: String,
        lastModifiedOn: String?,
        firstMonth: String?,
        lastMonth: String?,
        dateFormat: DateFormat?,
        currencyFormat: CurrencyFormat?,
        accounts: [Account]?,
        payees: [Payee]?,
        payeeLocations: [PayeeLocation]?,
        categoryGroups: [CategoryGroup]?,
        categories: [Category]?,
        months: [MonthDetail]?,
        transactions: [TransactionSummary]?,
        subtransactions: [SubTransaction]?,
        scheduledTransactions: [ScheduledTransactionSummary]?,
        scheduledSubtransactions: [ScheduledSubTransaction]?
    ) {
        self.id = id
        self.name = name
        self.lastModifiedOn = lastModifiedOn
        self.firstMonth = firstMonth
        self.lastMonth = lastMonth
        self.dateFormat = dateFormat
        self.currencyFormat = currencyFormat
        self.accounts = accounts
        self.payees = payees
        self.payeeLocations = payeeLocations
        self.categoryGroups = categoryGroups
        self.categories = categories
        self.months = months
        self.transactions = transactions
        self.subtransactions = subtransactions
        self.scheduledTransactions = scheduledTransactions
        self.scheduledSubtransactions = scheduledSubtransactions
    }
}
