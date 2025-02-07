//
//  CategoryGroupWithCategories.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Category group including categories
public struct CategoryGroupWithCategories: Codable, Equatable, Sendable {
    /// Category group id
    public let id: String

    /// Category name
    public let name: String

    /// Whether or not the category group is hidden
    public let hidden: Bool

    /// Whether or not the category group has been deleted. Deleted category groups will only be
    /// included in delta requests.
    public let deleted: Bool

    /// Categories belonging to this group. Amounts (budgeted, activity, balance, etc.) are specific
    /// to the current budget month (UTC).
    public let categories: [Category]
}
