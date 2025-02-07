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

    /// Amount budgeted for the month
    public let budgeted: Int

    /// Activity amount for the month
    public let activity: Int

    /// Available to be budgeted for the month
    public let toBeBudgeted: Int

    /// Age of money
    public let ageOfMoney: Int?

    /// Wether or not the month is deleted
    public let deleted: Bool

    /// Categories for the month
    public let categories: [Category]
}
