//
//  ScheduledTransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to scheduled transaction operations
public class ScheduledTransactionService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension ScheduledTransactionService: ScheduledTransactionServiceType {
    /// Returns a single scheduled transaction for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single scheduled transaction
    public func getScheduledTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = ScheduledTransactionRequest(budgetId: budgetId, transactionId: transactionId)
        let response: ScheduledTransactionResponse = try await client.request(request)
        return response.scheduledTransaction
    }

    /// Returns all scheduled transactions for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
    ///
    /// - Returns: A list of scheduled transactions
    public func getScheduledTransactions(budgetId: String) async throws
        -> [ScheduledTransactionDetail]
    {
        let request = ScheduledTransactionsRequest(budgetId: budgetId)
        let response: ScheduledTransactionsResponse = try await client.request(request)
        return response.scheduledTransactions
    }
}
