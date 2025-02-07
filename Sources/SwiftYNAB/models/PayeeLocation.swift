//
//  PayeeLocation.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Payee location model
public struct PayeeLocation: Codable, Equatable, Sendable {
    /// Payee location id
    public let id: String

    /// Payee id
    public let payeeId: String

    /// Longitude of the payee location
    public let longitude: String

    /// Latitude of the payee location
    public let latitude: String

    /// Whether or not the payee is deleted
    public let deleted: Bool
}
