//
//  BudgetSettings.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget settings model
public struct BudgetSettings: Codable, Equatable, Sendable {
    /// Date formatting settings
    public let dateFormat: DateFormat?

    /// Currency formatting settings
    public let currencyFormat: CurrencyFormat?
}
