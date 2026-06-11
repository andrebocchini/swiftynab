//
//  ErrorDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Model for API errors
public struct ErrorDetail: Codable, Equatable, Sendable {
    /// Error id
    public let id: String

    /// Short name for the error
    public let name: String

    /// Detailed message explaining the error
    public let detail: String

    public init(
        id: String,
        name: String,
        detail: String
    ) {
        self.id = id
        self.name = name
        self.detail = detail
    }
}
