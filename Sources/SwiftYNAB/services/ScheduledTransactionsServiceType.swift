//
//  ScheduledTransactionsServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol ScheduledTransactionServiceType: Sendable {
    func scheduledTransaction(planId: String, transactionId: String) async throws
        -> ScheduledTransactionDetail

    func scheduledTransactions(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([ScheduledTransactionDetail], ServerKnowledge)

    func createScheduledTransaction(
        planId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    func updateScheduledTransaction(
        planId: String,
        transactionId: String,
        transaction: SaveScheduledTransaction
    ) async throws -> ScheduledTransactionDetail

    func deleteScheduledTransaction(
        planId: String,
        transactionId: String
    ) async throws -> ScheduledTransactionDetail
}
