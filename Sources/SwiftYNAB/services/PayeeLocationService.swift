//
//  PayeeLocationService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee location operations
public struct PayeeLocationService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension PayeeLocationService: PayeeLocationServiceType {
    /// Returns a list of all payee locations for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of payee locations
    public func payeeLocations(planId: String) async throws -> [PayeeLocation] {
        let request = PayeeLocationsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.payeeLocations
    }

    /// Returns a specific payee location.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeLocationId: The id of the payee location
    ///
    /// - Returns: A single payee location
    public func payeeLocation(
        planId: String,
        payeeLocationId: String
    ) async throws -> PayeeLocation {
        let request = PayeeLocationRequest(planId: planId, payeeLocationId: payeeLocationId)
        let response = try await client.perform(request)
        return response.payeeLocation
    }

    /// Returns all locations for a payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee
    ///
    /// - Returns: A list of payee locations
    public func locationsForPayee(
        planId: String,
        payeeId: String
    ) async throws -> [PayeeLocation] {
        let request = LocationsForPayeeRequest(planId: planId, payeeId: payeeId)
        let response = try await client.perform(request)
        return response.payeeLocations
    }
}
