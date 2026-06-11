//
//  ScheduledTransactionsServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to scheduled transaction operations
public protocol ScheduledTransactionServiceType: Sendable {
    /// Returns a single scheduled transaction for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single scheduled transaction
    func scheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail

    /// Returns all scheduled transactions for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    /// have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of scheduled transactions and the knowledge of the server
    func scheduledTransactions(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ScheduledTransactionsResponse

    /// Creates a new scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transaction: The scheduled transaction data to create
    ///
    /// - Returns: The created scheduled transaction
    func createScheduledTransaction(
        planId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    /// Updates an existing scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the scheduled transaction to update
    ///    - transaction: The updated scheduled transaction data
    ///
    /// - Returns: The updated scheduled transaction
    func updateScheduledTransaction(
        planId: String,
        transactionId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    /// Deletes a scheduled transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the scheduled transaction to delete
    ///
    /// - Returns: The deleted scheduled transaction
    func deleteScheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail
}

public extension ScheduledTransactionServiceType {
    /// Returns all scheduled transactions for a plan, with optional parameters defaulted.
    func scheduledTransactions(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ScheduledTransactionsResponse {
        try await scheduledTransactions(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}
