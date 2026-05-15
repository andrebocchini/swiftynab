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
}
