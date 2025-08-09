//
//  Category.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget category
public struct Category: Codable, Equatable, Sendable {
    /// Category id in UUID format
    public let id: String

    /// Category group id in UUID format
    public let categoryGroupId: String

    /// Category group name
    public let categoryGroupName: String?

    /// Category name
    public let name: String

    /// Whether or not the category is hidden
    public let hidden: Bool

    /// Original category group id (DEPRECATED: No longer used. Value will always be null)
    public let originalCategoryGroupId: String?

    /// Category note
    public let note: String?

    /// Amount budgeted to this category in milliunits format
    public let budgeted: Int

    /// Activity on this category in milliunits format
    public let activity: Int

    /// Current balance on this category in milliunits format
    public let balance: Int

    /// Type of goal associated with this category
    /// Possible values: TB (Target Category Balance), TBD (Target Category Balance by Date),
    /// MF (Monthly Funding), NEED (Plan Your Spending), DEBT, or null
    public let goalType: String?

    /// Indicates the monthly rollover behavior for "NEED"-type goals.
    /// When "true", the goal will always ask for the target amount in the new month ("Set Aside").
    /// When "false", previous month category funding is used ("Refill").
    /// For other goal types, this field will be null.
    public let goalNeedsWholeAmount: Bool?

    /// A day offset modifier for the goal's due date. When goal_cadence is 2 (Weekly),
    /// this value specifies which day of the week the goal is due (0 = Sunday, 6 = Saturday).
    /// Otherwise, this value specifies which day of the month the goal is due
    /// (1 = 1st, 31 = 31st, null = Last day of Month).
    public let goalDay: Int?

    /// The goal cadence. Value in range 0-14. There are two subsets of these values which behave
    /// differently.
    /// For values 0, 1, 2, and 13, the goal's due date repeats every goal_cadence *
    /// goal_cadence_frequency,
    /// where 0 = None, 1 = Monthly, 2 = Weekly, and 13 = Yearly.
    /// For example, goal_cadence 1 with goal_cadence_frequency 2 means the goal is due every other
    /// month.
    /// For values 3-12 and 14, goal_cadence_frequency is ignored and the goal's due date repeats
    /// every goal_cadence,
    /// where 3 = Every 2 Months, 4 = Every 3 Months, ..., 12 = Every 11 Months, and 14 = Every 2
    /// Years.
    public let goalCadence: Int?

    /// The goal cadence frequency. When goal_cadence is 0, 1, 2, or 13,
    /// a goal's due date repeats every goal_cadence * goal_cadence_frequency.
    /// For example, goal_cadence 1 with goal_cadence_frequency 2 means the goal is due every other
    /// month.
    /// When goal_cadence is 3-12 or 14, goal_cadence_frequency is ignored.
    public let goalCadenceFrequency: Int?

    /// Goal creation month in ISO date format
    public let goalCreationMonth: String?

    /// Goal target amount in milliunits
    public let goalTarget: Int?

    /// The original target month for the goal to be completed in ISO date format
    public let goalTargetMonth: String?

    /// Goal percentage complete
    public let goalPercentageComplete: Int?

    /// The number of months, including the current month, left in the current goal period
    public let goalMonthsToBudget: Int?

    /// The amount of funding still needed in the current month to stay on track towards completing
    /// the goal within the current goal period. This amount will generally correspond to the
    /// 'Underfunded'
    /// amount in the web and mobile clients except when viewing a category with a Needed for
    /// Spending Goal in a future month.
    /// The web and mobile clients will ignore any funding from a prior goal period when viewing
    /// category with a Needed for
    /// Spending Goal in a future month.
    public let goalUnderFunded: Int?

    /// The total amount funded towards the goal within the current goal period in milliunits
    public let goalOverallFunded: Int?

    /// The amount of funding still needed to complete the goal within the current goal period in
    /// milliunits
    public let goalOverallLeft: Int?

    /// The date/time the goal was snoozed. If the goal is not snoozed, this will be null.
    public let goalSnoozedAt: String?

    /// Whether or not the category has been deleted
    public let deleted: Bool
}
