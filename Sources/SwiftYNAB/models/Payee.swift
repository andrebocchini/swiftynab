//
//  Payee.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Payee model
public struct Payee: Codable, Equatable, Sendable {
    /// Payeed id
    public let id: String

    /// Payee name
    public let name: String

    /// Transfer account id
    public let transferAccountId: String?

    /// Whether or not the payee is deleted
    public let deleted: Bool

    public init(
        id: String,
        name: String,
        transferAccountId: String?,
        deleted: Bool
    ) {
        self.id = id
        self.name = name
        self.transferAccountId = transferAccountId
        self.deleted = deleted
    }
}
