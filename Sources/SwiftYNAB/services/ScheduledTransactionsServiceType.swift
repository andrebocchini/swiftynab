//
//  ScheduledTransactionsServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol ScheduledTransactionServiceType: Sendable {
    func scheduledTransaction(budgetId: String, transactionId: String) async throws
        -> ScheduledTransactionDetail

    func scheduledTransactions(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([ScheduledTransactionDetail], ServerKnowledge)

    func createScheduledTransaction(
        budgetId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    func updateScheduledTransaction(
        budgetId: String,
        transactionId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    func deleteScheduledTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail
}
