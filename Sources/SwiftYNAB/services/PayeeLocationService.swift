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
    public func payeeLocations(planId: String) async throws -> [PayeeLocation] {
        let request = PayeeLocationsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.payeeLocations
    }

    public func payeeLocation(
        planId: String,
        payeeLocationId: String
    ) async throws -> PayeeLocation {
        let request = PayeeLocationRequest(planId: planId, payeeLocationId: payeeLocationId)
        let response = try await client.perform(request)
        return response.payeeLocation
    }

    public func locationsForPayee(
        planId: String,
        payeeId: String
    ) async throws -> [PayeeLocation] {
        let request = LocationsForPayeeRequest(planId: planId, payeeId: payeeId)
        let response = try await client.perform(request)
        return response.payeeLocations
    }
}
