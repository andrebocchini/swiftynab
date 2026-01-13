//
//  ScheduledTransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to scheduled transaction operations
public struct ScheduledTransactionService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension ScheduledTransactionService: ScheduledTransactionServiceType {
    /// Returns a single scheduled transaction for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single scheduled transaction
    public func scheduledTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = ScheduledTransactionRequest(budgetId: budgetId, transactionId: transactionId)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Returns all scheduled transactions for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget).
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    /// have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of scheduled transactions and server knowledge
    public func scheduledTransactions(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([ScheduledTransactionDetail], ServerKnowledge) {
        let request = ScheduledTransactionsRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.scheduledTransactions, response.serverKnowledge)
    }

    /// Creates a new scheduled transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transaction: The scheduled transaction data to create
    ///
    /// - Returns: The created scheduled transaction
    public func createScheduledTransaction(
        budgetId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail {
        let request = SaveScheduledTransactionRequest(budgetId: budgetId, transaction: transaction)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Updates an existing scheduled transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transactionId: The id of the scheduled transaction to update
    ///    - transaction: The updated scheduled transaction data
    ///
    /// - Returns: The updated scheduled transaction
    public func updateScheduledTransaction(
        budgetId: String,
        transactionId _: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail {
        let request = SaveScheduledTransactionRequest(
            budgetId: budgetId,
            transaction: transaction,
            update: true
        )
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Deletes a scheduled transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transactionId: The id of the scheduled transaction to delete
    ///
    /// - Returns: The deleted scheduled transaction
    public func deleteScheduledTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = DeleteScheduledTransactionRequest(
            budgetId: budgetId,
            scheduledTransactionId: transactionId
        )
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }
}
