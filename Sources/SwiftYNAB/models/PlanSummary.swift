//
//  PlanSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Plan summary model
public struct PlanSummary: Codable, Equatable, Sendable {
    /// Plan id
    public let id: String

    /// Plan name
    public let name: String

    /// Date the plan was last modified (in ISO date-time format)
    public let lastModifiedOn: String?

    /// Plan's first month (in ISO date format)
    public let firstMonth: String?

    /// Plan's last month (in ISO date format)
    public let lastMonth: String?

    /// Date formatting settings
    public let dateFormat: DateFormat?

    /// Currency formatting settings
    public let currencyFormat: CurrencyFormat?

    /// Optional accounts
    public let accounts: [Account]?
}
