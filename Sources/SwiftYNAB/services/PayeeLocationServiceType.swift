//
//  PayeeLocationServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee location operations
public protocol PayeeLocationServiceType: Sendable {
    /// Returns a list of all payee locations for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of payee locations
    func payeeLocations(planId: String) async throws -> [PayeeLocation]

    /// Returns a specific payee location.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeLocationId: The id of the payee location
    ///
    /// - Returns: A single payee location
    func payeeLocation(planId: String, payeeLocationId: String) async throws -> PayeeLocation

    /// Returns all locations for a payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee
    ///
    /// - Returns: A list of payee locations
    func locationsForPayee(planId: String, payeeId: String) async throws -> [PayeeLocation]
}
