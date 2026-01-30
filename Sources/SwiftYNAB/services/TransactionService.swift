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
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A tuple containing a single transaction and server knowledge
    public func transaction(
        budgetId: String,
        transactionId: String
    ) async throws -> (TransactionDetail, ServerKnowledge) {
        let request = TransactionRequest(budgetId: budgetId, transactionId: transactionId)
        let respose = try await client.perform(request)
        return (respose.transaction, respose.serverKnowledge)
    }

    /// Returns all transactions for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The
    /// date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A tuple containing a list of transactions and server knowledge
    public func transactions(
        budgetId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([TransactionDetail], ServerKnowledge) {
        let request = TransactionsByBudgetRequest(
            budgetId: budgetId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for an account.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
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
        budgetId: String,
        accountId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([TransactionDetail], ServerKnowledge) {
        let request = TransactionsByAccountRequest(
            budgetId: budgetId,
            accountId: accountId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for a category.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
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
        budgetId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByCategoryRequest(
            budgetId: budgetId,
            categoryId: categoryId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge)
    }

    /// Returns all transactions for a payee.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
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
        budgetId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByPayeeRequest(
            budgetId: budgetId,
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
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
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
        budgetId: String,
        month: Date,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([HybridTransaction], ServerKnowledge) {
        let request = TransactionsByMonthRequest(
            budgetId: budgetId,
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
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transaction: The transaction data to create
    ///
    /// - Returns: A tuple containing the created transaction, server knowledge, and duplicate
    /// import IDs
    public func createTransaction(
        budgetId: String,
        transaction: SaveTransactionWithIdOrImportId
    ) async throws -> (TransactionDetail, ServerKnowledge) {
        let request = CreateTransactionRequest(budgetId: budgetId, transaction: transaction)
        let response = try await client.perform(request)
        return (response.transaction, response.serverKnowledge)
    }

    /// Creates multiple transactions.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transactions: An array of transaction data to create
    ///
    /// - Returns: A tuple containing the created transactions, server knowledge, and duplicate
    /// import IDs
    public func createTransactions(
        budgetId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String]) {
        let request = CreateTransactionsRequest(budgetId: budgetId, transactions: transactions)
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge, response.duplicateImportIds)
    }

    /// Updates multiple transactions.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transactions: An array of transaction data to update
    ///
    /// - Returns: A tuple containing the updated transactions, server knowledge, and duplicate
    /// import IDs
    public func updateTransactions(
        budgetId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> ([TransactionDetail], ServerKnowledge, [String]) {
        let request = UpdateTransactionsRequest(budgetId: budgetId, transactions: transactions)
        let response = try await client.perform(request)
        return (response.transactions, response.serverKnowledge, response.duplicateImportIds)
    }

    /// Updates a single transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transaction: The transaction data to update
    ///
    /// - Returns: The updated transaction
    public func updateTransaction(
        budgetId: String,
        transactionId: String,
        transaction: SaveTransactionWithIdOrImportId
    ) async throws -> TransactionDetail {
        let request = UpdateTransactionRequest(
            budgetId: budgetId,
            transactionId: transactionId,
            transaction: transaction
        )
        let response = try await client.perform(request)
        return response.transaction
    }

    /// Imports transactions that have been uploaded via file-based import.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///
    /// - Returns: An array of transaction IDs for the imported transactions
    public func importTransactions(
        budgetId: String
    ) async throws -> [String] {
        let request = ImportTransactionsRequest(budgetId: budgetId)
        let response = try await client.perform(request)
        return response.transactionIds
    }

    /// Deletes a transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - transactionId: The id of the transaction to delete
    ///
    /// - Returns: The deleted transaction
    public func deleteTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> TransactionDetail {
        let request = DeleteTransactionRequest(budgetId: budgetId, transactionId: transactionId)
        let response = try await client.perform(request)
        return response.transaction
    }
}
