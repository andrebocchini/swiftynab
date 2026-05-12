//
//  TransactionServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol TransactionServiceType: Sendable {
    func transaction(planId: String, transactionId: String) async throws
        -> (TransactionDetail, ServerKnowledge)

    func transactions(
        planId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([TransactionDetail], ServerKnowledge)

    func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([TransactionDetail], ServerKnowledge)

    func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func transactions(
        planId: String,
        month: Date,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([HybridTransaction], ServerKnowledge)

    func createTransaction(
        planId: String,
        transaction: NewTransaction
    ) async throws -> (TransactionDetail, ServerKnowledge)

    func createTransactions(
        planId: String,
        transactions: [NewTransaction]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String])

    func updateTransactions(
        planId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String])

    func updateTransaction(
        planId: String,
        transactionId: String,
        transaction: ExistingTransaction
    ) async throws -> TransactionDetail

    func importTransactions(
        planId: String
    ) async throws -> [String]

    func deleteTransaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionDetail
}
