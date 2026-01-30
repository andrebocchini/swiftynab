//
//  PayeeLocationServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PayeeLocationServiceType: Sendable {
    func payeeLocations(budgetId: String) async throws -> [PayeeLocation]

    func payeeLocation(budgetId: String, payeeLocationId: String) async throws -> PayeeLocation

    func locationsForPayee(budgetId: String, payeeId: String) async throws -> [PayeeLocation]
}
