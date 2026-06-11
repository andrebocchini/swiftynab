//
//  UserServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to user operations
public protocol UserServiceType: Sendable {
    /// Returns authenticated user information
    ///
    /// - Returns: A single user
    func user() async throws -> User
}
