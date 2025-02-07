//
//  SaveMonthCategory.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a month category to be saved or updated
public struct SaveMonthCategory: Codable, Equatable, Sendable {
    /// Budgeted amount in milliunits format
    public let budgeted: Int

    /// Creates a new SaveMonthCategory instance
    /// - Parameter budgeted: Budgeted amount in milliunits format
    public init(budgeted: Int) {
        self.budgeted = budgeted
    }
}
