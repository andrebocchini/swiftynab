//
//  TransactionServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol TransactionServiceType {
    func getTransaction(budgetId: String, transactionId: String) async throws -> TransactionDetail

    func getTransactions(
        budgetId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> [TransactionDetail]

    func getTransactions(
        budgetId: String,
        accountId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> [TransactionDetail]

    func getTransactions(
        budgetId: String,
        categoryId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> [HybridTransaction]

    func getTransactions(
        budgetId: String,
        payeeId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> [HybridTransaction]

    func saveTransaction(budgetId: String, transaction: NewTransaction) async throws
        -> TransactionDetail

    func saveTransactions(budgetId: String, transactions: [NewTransaction]) async throws
        -> (
            transactions: [TransactionDetail],
            transactionIds: [String],
            duplicateImportIds: [String]
        )

    func updateTransaction(budgetId: String, transaction: UpdateTransaction) async throws
        -> TransactionDetail

    func updateTransactions(budgetId: String, transactions: [UpdateTransaction]) async throws
        -> (
            transactions: [TransactionDetail],
            transactionIds: [String],
            duplicateImportIds: [String]
        )
}
