//
//  PayeeLocationServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PayeeLocationServiceType: Sendable {
    func getPayeeLocations(budgetId: String) async throws -> [PayeeLocation]

    func getPayeeLocation(budgetId: String, payeeId: String) async throws -> PayeeLocation

    func getLocationsForPayee(budgetId: String, payeeId: String) async throws -> [PayeeLocation]
}
