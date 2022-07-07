//
//  BudgetSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget summary model
public struct BudgetSummary: Codable, Equatable {
    /// Budget id
    public let id: String

    /// Budget name
    public let name: String

    /// Date the budget was last modified
    public let lastModifiedOn: String

    /// Budget's first month
    public let firstMonth: String

    /// Budget's last month
    public let lastMonth: String

    /// Date formatting settings
    public let dateFormat: DateFormat

    /// Currency formatting settings
    public let currencyFormat: CurrencyFormat
}
