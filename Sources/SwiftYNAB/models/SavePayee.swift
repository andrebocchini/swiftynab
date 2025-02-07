//
//  SavePayee.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a payee to be saved or updated
public struct SavePayee: Codable, Equatable, Sendable {
    /// The name of the payee. The name must be a maximum of 500 characters.
    public let name: String

    /// Creates a new SavePayee instance
    /// - Parameter name: The name of the payee (maximum 500 characters)
    public init(name: String) {
        // Ensure name doesn't exceed max length
        if name.count > 500 {
            self.name = String(name.prefix(500))
        } else {
            self.name = name
        }
    }
}
