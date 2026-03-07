//
//  SaveCategoryGroup.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a category group to be saved or updated
public struct SaveCategoryGroup: Codable, Equatable, Sendable {
    /// The name of the category group. The name must be a maximum of 50 characters.
    public let name: String

    /// Creates a new SaveCategoryGroup instance
    /// - Parameter name: The name of the category group (maximum 50 characters)
    public init(name: String) {
        if name.count > 50 {
            self.name = String(name.prefix(50))
        } else {
            self.name = name
        }
    }
}
