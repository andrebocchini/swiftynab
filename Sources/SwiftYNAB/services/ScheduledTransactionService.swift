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
    /// Returns a single scheduled transaction for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single scheduled transaction
    public func scheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = ScheduledTransactionRequest(planId: planId, transactionId: transactionId)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Returns all scheduled transactions for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    /// have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of scheduled transactions and server knowledge
    public func scheduledTransactions(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([ScheduledTransactionDetail], ServerKnowledge) {
        let request = ScheduledTransactionsRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.scheduledTransactions, response.serverKnowledge)
    }

    /// Creates a new scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transaction: The scheduled transaction data to create
    ///
    /// - Returns: The created scheduled transaction
    public func createScheduledTransaction(
        planId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail {
        let request = SaveScheduledTransactionRequest(planId: planId, transaction: transaction)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Updates an existing scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the scheduled transaction to update
    ///    - transaction: The updated scheduled transaction data
    ///
    /// - Returns: The updated scheduled transaction
    public func updateScheduledTransaction(
        planId: String,
        transactionId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail {
        let request = SaveScheduledTransactionRequest(
            planId: planId,
            transaction: transaction,
            update: true,
            scheduledTransactionId: transactionId
        )
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    /// Deletes a scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the scheduled transaction to delete
    ///
    /// - Returns: The deleted scheduled transaction
    public func deleteScheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = DeleteScheduledTransactionRequest(
            planId: planId,
            scheduledTransactionId: transactionId
        )
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }
}
