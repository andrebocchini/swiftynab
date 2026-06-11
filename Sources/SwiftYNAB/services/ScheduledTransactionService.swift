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
    public func scheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail {
        let request = ScheduledTransactionRequest(planId: planId, transactionId: transactionId)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

    public func scheduledTransactions(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ScheduledTransactionsResponse {
        let request = ScheduledTransactionsRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return ScheduledTransactionsResponse(
            scheduledTransactions: response.scheduledTransactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func createScheduledTransaction(
        planId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail {
        let request = SaveScheduledTransactionRequest(planId: planId, transaction: transaction)
        let response = try await client.perform(request)
        return response.scheduledTransaction
    }

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
