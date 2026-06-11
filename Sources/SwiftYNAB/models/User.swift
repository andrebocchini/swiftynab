//
//  User.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Authenticate user information
public struct User: Codable, Equatable, Sendable {
    /// User id
    public let id: String

    public init(
        id: String
    ) {
        self.id = id
    }
}
