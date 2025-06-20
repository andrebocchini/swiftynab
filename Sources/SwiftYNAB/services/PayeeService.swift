//
//  PayeeService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee operations
public struct PayeeService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension PayeeService: PayeeServiceType {
    /// Returns all payees
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of payees
    public func payees(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> [Payee] {
        let request = PayeesRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return response.payees
    }

    /// Returns a single payee.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A single payee
    public func payee(budgetId: String, payeeId: String) async throws -> Payee {
        let request = PayeeRequest(budgetId: budgetId, payeeId: payeeId)
        let response = try await client.perform(request)
        return response.payee
    }

    /// Updates a single payee.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - payeeId: The id of the payee being update
    ///    - payee: The details of the payee that need to be updated
    ///
    /// - Returns: A single payee and the last server knowledge
    func updatePayee(
        budgetId: String,
        payeeId: String,
        payee: SavePayee
    ) async throws -> (Payee, ServerKnowledge) {
        let request = UpdatePayeeRequest(
            budgetId: budgetId,
            payeeId: payeeId,
            payee: payee
        )
        let response = try await client.perform(request)
        return (response.payee, response.serverKnowledge)
    }
}
