//
//  CategoryGroup.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Category group model
public struct CategoryGroup: Codable, Equatable, Sendable {
    /// Category group id in UUID format
    public let id: String

    /// Category group name
    public let name: String

    /// Whether or not the category group is hidden
    public let hidden: Bool

    /// Whether or not the category group is internal
    public let `internal`: Bool

    /// Whether or not the category group has been deleted. Deleted category groups will only be
    /// included in delta requests.
    public let deleted: Bool

    public init(
        id: String,
        name: String,
        hidden: Bool,
        `internal`: Bool = false,
        deleted: Bool
    ) {
        self.id = id
        self.name = name
        self.hidden = hidden
        self.internal = `internal`
        self.deleted = deleted
    }
}
