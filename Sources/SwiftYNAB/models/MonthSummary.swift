//
//  MonthSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Month summary model
public struct MonthSummary: Codable, Equatable, Sendable {
    /// Month
    public let month: String

    /// Note
    public let note: String?

    /// Amount of income for the month
    public let income: Int

    /// Budgeted amount for the month
    public let budgeted: Int

    /// Activity for the month
    public let activity: Int

    /// Amount available to be budgeted for the month
    public let toBeBudgeted: Int

    /// Age of money
    public let ageOfMoney: Int?

    /// Whether or not the month is deleted
    public let deleted: Bool
}
