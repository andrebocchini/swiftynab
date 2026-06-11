//
//  PayeeServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee operations
public protocol PayeeServiceType: Sendable {
    /// Creates a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payee: The payee to create
    ///
    /// - Returns: A single payee and the knowledge of the server
    func createPayee(planId: String, payee: SavePayee) async throws -> PayeeResponse

    /// Returns all payees
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of payees and the knowledge of the server
    func payees(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> PayeesResponse

    /// Returns a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee
    ///
    /// - Returns: A single payee
    func payee(planId: String, payeeId: String) async throws -> Payee

    /// Updates a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee being update
    ///    - payee: The details of the payee that need to be updated
    ///
    /// - Returns: A single payee and the knowledge of the server
    func updatePayee(
        planId: String,
        payeeId: String,
        payee: SavePayee
    ) async throws -> PayeeResponse
}

public extension PayeeServiceType {
    /// Returns all payees, with optional parameters defaulted.
    func payees(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> PayeesResponse {
        try await payees(planId: planId, lastKnowledgeOfServer: lastKnowledgeOfServer)
    }
}
