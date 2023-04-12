//
//  Category.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget category
public struct Category: Codable, Equatable {
    /// Category id
    public let id: String

    /// Category group id
    public let categoryGroupId: String

    /// Category name
    public let name: String

    /// Whether or not the category is hidden
    public let hidden: Bool

    /// Original category group id
    public let originalCategoryGroupId: String?

    /// Category note
    public let note: String?

    /// Amount budgeted to this category
    public let budgeted: Int

    /// Activity on this category
    public let activity: Int

    /// Current balance on this category
    public let balance: Int

    /// Type of goal associated with this category
    public let goalType: String?

    /// The day of the goal
    public let goalDay: Int?

    /// The goal cadence
    public let goalCadence: Int?

    /// The goal cadence frequency
    public let goalCadenceFrequency: Int?

    /// Goal creation month
    public let goalCreationMonth: String?

    /// Goal target amount
    public let goalTarget: Int?

    /// Goal target date
    public let goalTargetMonth: String?

    /// Goal percentage complete
    public let goalPercentageComplete: Int?

    /// The number of months, including the current month, left in the current goal period.
    public let goalMonthsToBudget: Int?

    /// The amount of funding still needed in the current month to stay on track towards completing the goal within the current
    /// goal period. This amount will generally correspond to the ‘Underfunded’ amount in the web and mobile clients except when
    /// viewing a category with a Needed for Spending Goal in a future month. The web and mobile clients will ignore any funding
    ///  from a prior goal period when viewing category with a Needed for Spending Goal in a future month.
    public let goalUnderFunded: Int?

    /// The total amount funded towards the goal within the current goal period.
    public let goalOverallFunded: Int?

    /// The amount of funding still needed to complete the goal within the current goal period.
    public let goalOverallLeft: Int?

    /// Whether or not the goal is deleted
    public let deleted: Bool
}
