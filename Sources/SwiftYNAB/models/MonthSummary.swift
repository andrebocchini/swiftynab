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

    /// Amount of income for the month formatted in the plan currency
    public let incomeFormatted: String?

    /// Amount of income for the month as a decimal currency amount
    public let incomeCurrency: Decimal?

    /// Budgeted amount for the month
    public let budgeted: Int

    /// Budgeted amount for the month formatted in the plan currency
    public let budgetedFormatted: String?

    /// Budgeted amount for the month as a decimal currency amount
    public let budgetedCurrency: Decimal?

    /// Activity for the month
    public let activity: Int

    /// Activity for the month formatted in the plan currency
    public let activityFormatted: String?

    /// Activity for the month as a decimal currency amount
    public let activityCurrency: Decimal?

    /// Amount available to be budgeted for the month
    public let toBeBudgeted: Int

    /// Amount available to be budgeted for the month formatted in the plan currency
    public let toBeBudgetedFormatted: String?

    /// Amount available to be budgeted for the month as a decimal currency amount
    public let toBeBudgetedCurrency: Decimal?

    /// Age of money
    public let ageOfMoney: Int?

    /// Whether or not the month is deleted
    public let deleted: Bool

    public init(
        month: String,
        note: String?,
        income: Int,
        incomeFormatted: String?,
        incomeCurrency: Decimal?,
        budgeted: Int,
        budgetedFormatted: String?,
        budgetedCurrency: Decimal?,
        activity: Int,
        activityFormatted: String?,
        activityCurrency: Decimal?,
        toBeBudgeted: Int,
        toBeBudgetedFormatted: String?,
        toBeBudgetedCurrency: Decimal?,
        ageOfMoney: Int?,
        deleted: Bool
    ) {
        self.month = month
        self.note = note
        self.income = income
        self.incomeFormatted = incomeFormatted
        self.incomeCurrency = incomeCurrency
        self.budgeted = budgeted
        self.budgetedFormatted = budgetedFormatted
        self.budgetedCurrency = budgetedCurrency
        self.activity = activity
        self.activityFormatted = activityFormatted
        self.activityCurrency = activityCurrency
        self.toBeBudgeted = toBeBudgeted
        self.toBeBudgetedFormatted = toBeBudgetedFormatted
        self.toBeBudgetedCurrency = toBeBudgetedCurrency
        self.ageOfMoney = ageOfMoney
        self.deleted = deleted
    }
}
