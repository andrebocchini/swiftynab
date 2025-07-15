//
//  TransactionServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol TransactionServiceType: Sendable {
    func transaction(budgetId: String, transactionId: String) async throws -> TransactionDetail

    func transactions(
        budgetId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([TransactionDetail], ServerKnowledge)

    func transactions(
        budgetId: String,
        accountId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([TransactionDetail], ServerKnowledge)

    func transactions(
        budgetId: String,
        categoryId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func transactions(
        budgetId: String,
        payeeId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func transactions(
        budgetId: String,
        month: Date,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func createTransaction(
        budgetId: String,
        transaction: SaveTransactionWithIdOrImportId
    ) async throws -> (TransactionDetail, ServerKnowledge)

    func createTransactions(
        budgetId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String])

    func updateTransactions(
        budgetId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String])

    func updateTransaction(
        budgetId: String,
        transaction: SaveTransactionWithIdOrImportId
    ) async throws -> TransactionDetail

    func importTransactions(
        budgetId: String
    ) async throws -> [String]

    func deleteTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> TransactionDetail
}
