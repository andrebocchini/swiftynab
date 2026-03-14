//
//  PayeeLocationServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PayeeLocationServiceType: Sendable {
    func payeeLocations(planId: String) async throws -> [PayeeLocation]

    func payeeLocation(planId: String, payeeLocationId: String) async throws -> PayeeLocation

    func locationsForPayee(planId: String, payeeId: String) async throws -> [PayeeLocation]
}
