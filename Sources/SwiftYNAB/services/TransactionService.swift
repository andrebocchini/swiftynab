//
//  TransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to transaction operations
public struct TransactionService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension TransactionService: TransactionServiceType {
    public func transaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionResponse {
        let request = TransactionRequest(planId: planId, transactionId: transactionId)
        let response = try await client.perform(request)
        return TransactionResponse(
            transaction: response.transaction,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func transactions(
        planId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    public func transactions(
        planId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let request = TransactionsByPlanRequest(
            planId: planId,
            sinceDate: query.sinceDate,
            untilDate: query.untilDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return TransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            accountId: accountId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    public func transactions(
        planId: String,
        accountId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let request = TransactionsByAccountRequest(
            planId: planId,
            accountId: accountId,
            sinceDate: query.sinceDate,
            untilDate: query.untilDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return TransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            categoryId: categoryId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    public func transactions(
        planId: String,
        categoryId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse {
        let request = TransactionsByCategoryRequest(
            planId: planId,
            categoryId: categoryId,
            sinceDate: query.sinceDate,
            untilDate: query.untilDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return HybridTransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            payeeId: payeeId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    public func transactions(
        planId: String,
        payeeId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse {
        let request = TransactionsByPayeeRequest(
            planId: planId,
            payeeId: payeeId,
            sinceDate: query.sinceDate,
            untilDate: query.untilDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return HybridTransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func transactions(
        planId: String,
        month: Date,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            month: month,
            query: TransactionQuery(
                sinceDate: sinceDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    public func transactions(
        planId: String,
        month: Date,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let request = TransactionsByMonthRequest(
            planId: planId,
            month: month,
            sinceDate: query.sinceDate,
            untilDate: query.untilDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return TransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func createTransaction(
        planId: String,
        transaction: NewTransaction
    ) async throws -> SaveTransactionResponse {
        let request = CreateTransactionRequest(planId: planId, transaction: transaction)
        let response = try await client.perform(request)
        return SaveTransactionResponse(
            transaction: response.transaction,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func createTransactions(
        planId: String,
        transactions: [NewTransaction]
    ) async throws -> SaveTransactionsResponse {
        let request = CreateTransactionsRequest(planId: planId, transactions: transactions)
        let response = try await client.perform(request)
        return SaveTransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge,
            duplicateImportIds: response.duplicateImportIds
        )
    }

    public func updateTransactions(
        planId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> SaveTransactionsResponse {
        let request = UpdateTransactionsRequest(planId: planId, transactions: transactions)
        let response = try await client.perform(request)
        return SaveTransactionsResponse(
            transactions: response.transactions,
            serverKnowledge: response.serverKnowledge,
            duplicateImportIds: response.duplicateImportIds
        )
    }

    public func updateTransaction(
        planId: String,
        transactionId: String,
        transaction: ExistingTransaction
    ) async throws -> TransactionResponse {
        let request = UpdateTransactionRequest(
            planId: planId,
            transactionId: transactionId,
            transaction: transaction
        )
        let response = try await client.perform(request)
        return TransactionResponse(
            transaction: response.transaction,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func importTransactions(planId: String) async throws -> [String] {
        let request = ImportTransactionsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.transactionIds
    }

    public func deleteTransaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionResponse {
        let request = DeleteTransactionRequest(planId: planId, transactionId: transactionId)
        let response = try await client.perform(request)
        return TransactionResponse(
            transaction: response.transaction,
            serverKnowledge: response.serverKnowledge
        )
    }
}
