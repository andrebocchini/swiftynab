//
//  CategoryGroup.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Category group model
public struct CategoryGroup: Codable, Equatable {
    /// Category group id
    public let id: String

    /// Category name
    public let name: String

    /// Whether or not the category is hidden
    public let hidden: Bool

    /// Whether or not the category is deleted
    public let deleted: Bool
}
