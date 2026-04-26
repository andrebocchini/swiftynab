//
//  MonthDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Month detail model
public struct MonthDetail: Codable, Equatable, Sendable {
    /// Month
    public let month: String

    /// Month note
    public let note: String?

    /// Income amount for the month
    public let income: Int

    /// Income amount for the month formatted in the plan currency
    public let incomeFormatted: String?

    /// Income amount for the month as a decimal currency amount
    public let incomeCurrency: Decimal?

    /// Amount budgeted for the month
    public let budgeted: Int

    /// Amount budgeted for the month formatted in the plan currency
    public let budgetedFormatted: String?

    /// Amount budgeted for the month as a decimal currency amount
    public let budgetedCurrency: Decimal?

    /// Activity amount for the month
    public let activity: Int

    /// Activity amount for the month formatted in the plan currency
    public let activityFormatted: String?

    /// Activity amount for the month as a decimal currency amount
    public let activityCurrency: Decimal?

    /// Available to be budgeted for the month
    public let toBeBudgeted: Int

    /// Available to be budgeted for the month formatted in the plan currency
    public let toBeBudgetedFormatted: String?

    /// Available to be budgeted for the month as a decimal currency amount
    public let toBeBudgetedCurrency: Decimal?

    /// Age of money
    public let ageOfMoney: Int?

    /// Wether or not the month is deleted
    public let deleted: Bool

    /// Categories for the month
    public let categories: [Category]
}
