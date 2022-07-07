//
//  PayeeService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee operations
public class PayeeService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension PayeeService: PayeeServiceType {
    /// Returns all payees
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of payees
    public func getPayees(
        budgetId: String,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [Payee] {
        let request = PayeesRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: PayeesResponse = try await client.request(request)
        return response.payees
    }

    /// Returns a single payee.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
    ///    will be included.
    /// - Returns: A single payee
    public func getPayee(budgetId: String, payeeId: String) async throws -> Payee {
        let request = PayeeRequest(budgetId: budgetId, payeeId: payeeId)
        let response: PayeeResponse = try await client.request(request)
        return response.payee
    }
}
