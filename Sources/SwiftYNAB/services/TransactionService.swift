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
    /// Returns a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A tuple containing a single transaction and server knowledge
    public func transaction(
        planId: String,
        transactionId: String
    ) async throws -> (TransactionDetail, ServerKnowledge) {
        let request = TransactionRequest(planId: planId, transactionId: transactionId)
        let respose = try await client.perform(request)
        return (respose.transaction, respose.serverKnowledge)
    }

    /// Returns all transactions for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of transactions and server knowledge
    public func transactions(
        planId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([TransactionDetail], ServerKnowledge) {
        let request = TransactionsByPlanRequest(
            planId: planId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for an account in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - accountId: The id of the account.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of transactions and server knowledge
    public func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([TransactionDetail], ServerKnowledge) {
        let request = TransactionsByAccountRequest(
            planId: planId,
            accountId: accountId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for a category in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryId: The id of the category.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of hybrid transactions and server knowledge
    public func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByCategoryRequest(
            planId: planId,
            categoryId: categoryId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for a payee in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of hybrid transactions and server knowledge
    public func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByPayeeRequest(
            planId: planId,
            payeeId: payeeId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for a specific month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The month to filter transactions by.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of hybrid transactions and server knowledge
    public func transactions(
        planId: String,
        month: Date,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByMonthRequest(
            planId: planId,
            month: month,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Creates a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transaction: The transaction data to create
    ///
    /// - Returns: A tuple containing the created transaction, server knowledge, and duplicate
    /// import IDs
    public func createTransaction(
        planId: String,
        transaction: NewTransaction
    ) async throws -> (TransactionDetail, ServerKnowledge) {
        let request = CreateTransactionRequest(planId: planId, transaction: transaction)
        let response = try await client.perform(request)
        return (response.transaction, response.serverKnowledge)
    }

    /// Creates multiple transactions.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactions: An array of transaction data to create
    ///
    /// - Returns: A tuple containing the created transactions, server knowledge, and duplicate
    /// import IDs
    public func createTransactions(
        planId: String,
        transactions: [NewTransaction]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String]) {
        let request = CreateTransactionsRequest(planId: planId, transactions: transactions)
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge, response.duplicateImportIds)
    }

    /// Updates multiple transactions.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactions: An array of transaction data to update
    ///
    /// - Returns: A tuple containing the updated transactions, server knowledge, and duplicate
    /// import IDs
    public func updateTransactions(
        planId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String]) {
        let request = UpdateTransactionsRequest(planId: planId, transactions: transactions)
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge, response.duplicateImportIds)
    }

    /// Updates a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transaction: The transaction data to update
    ///
    /// - Returns: The updated transaction
    public func updateTransaction(
        planId: String,
        transactionId: String,
        transaction: ExistingTransaction
    ) async throws -> TransactionDetail {
        let request = UpdateTransactionRequest(
            planId: planId,
            transactionId: transactionId,
            transaction: transaction
        )
        let response = try await client.perform(request)
        return response.transaction
    }

    /// Imports transactions that have been uploaded via file-based import.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: An array of transaction IDs for the imported transactions
    public func importTransactions(
        planId: String
    ) async throws -> [String] {
        let request = ImportTransactionsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.transactionIds
    }

    /// Deletes a transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the transaction to delete
    ///
    /// - Returns: The deleted transaction
    public func deleteTransaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionDetail {
        let request = DeleteTransactionRequest(planId: planId, transactionId: transactionId)
        let response = try await client.perform(request)
        return response.transaction
    }
}
