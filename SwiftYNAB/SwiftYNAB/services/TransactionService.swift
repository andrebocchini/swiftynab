//
//  TransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to transaction operations
public class TransactionService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension TransactionService: TransactionServiceType {
    /// Returns a single transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single transaction
    public func getTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> TransactionDetail {
        let request = TransactionRequest(budgetId: budgetId, transactionId: transactionId)
        let respose: TransactionResponse = try await client.request(request)
        return respose.transaction
    }

    /// Returns all transactions for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions
    public func getTransactions(
        budgetId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [TransactionDetail] {
        let request = TransactionsByBudgetRequest(
            budgetId: budgetId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: TransactionsResponse = try await client.request(request)
        return response.transactions
    }

    /// Returns all transactions for an account.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - accountId: The id of the account.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions
    public func getTransactions(
        budgetId: String,
        accountId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [TransactionDetail] {
        let request = TransactionsByAccountRequest(
            budgetId: budgetId,
            accountId: accountId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: TransactionsResponse = try await client.request(request)
        return response.transactions
    }

    /// Returns all transactions for a category.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - categoryId: The id of the category.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions
    public func getTransactions(
        budgetId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [HybridTransaction] {
        let request = TransactionsByCategoryRequest(
            budgetId: budgetId,
            categoryId: categoryId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: HybridTransactionsResponse = try await client.request(request)
        return response.transactions
    }

    /// Returns all transactions for a payee.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - payeeId: The id of the payee.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. The date should be ISO formatted
    ///    (e.g. 2016-12-30).
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions
    public func getTransactions(
        budgetId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [HybridTransaction] {
        let request = TransactionsByPayeeRequest(
            budgetId: budgetId,
            payeeId: payeeId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: HybridTransactionsResponse = try await client.request(request)
        return response.transactions
    }

    /// Creates a new transactions.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - transaction: New transaction
    ///
    /// - Returns: The newly created transaction
    public func saveTransaction(
        budgetId: String,
        transaction: NewTransaction
    ) async throws -> TransactionDetail {
        let request = SaveTransactionRequest(budgetId: budgetId, transaction: transaction)
        let response: SaveTransactionResponse = try await client.request(request)
        return response.transaction
    }

    /// Creates several new transactions.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - transactions: New transactions
    ///
    /// - Returns: The newly created transactions
    public func saveTransactions(
        budgetId: String,
        transactions: [NewTransaction]
    ) async throws
        -> (
            transactions: [TransactionDetail],
            transactionIds: [String],
            duplicateImportIds: [String]
        )
    {
        let request = SaveTransactionsRequest(budgetId: budgetId, transactions: transactions)
        let response: SaveTransactionsResponse = try await client.request(request)
        return (
            response.transactions,
            response.transactionIds,
            response.duplicateImportIds
        )
    }

    /// Updates a single transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - transaction: Transaction to be updated
    ///
    /// - Returns: The updated transaction
    public func updateTransaction(
        budgetId: String,
        transaction: UpdateTransaction
    ) async throws -> TransactionDetail {
        let request = SaveTransactionRequest(
            budgetId: budgetId,
            transaction: transaction,
            update: true
        )
        let response: SaveTransactionResponse = try await client.request(request)
        return response.transaction
    }

    /// Updates several transactions.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - transactions: Updated transactions
    ///
    /// - Returns: The updated transactions
    public func updateTransactions(
        budgetId: String,
        transactions: [UpdateTransaction]
    ) async throws
        -> (
            transactions: [TransactionDetail],
            transactionIds: [String],
            duplicateImportIds: [String]
        )
    {
        let request = SaveTransactionsRequest(
            budgetId: budgetId,
            transactions: transactions,
            update: true
        )
        let response: SaveTransactionsResponse = try await client.request(request)
        return (
            response.transactions,
            response.transactionIds,
            response.duplicateImportIds
        )
    }

    /// Delete a single transaction.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - transactionId: Id of the rransaction to be deleted
    ///
    /// - Returns: The updated transaction
    public func deleteTransaction(
        budgetId: String,
        transactionId: String
    ) async throws -> TransactionDetail {
        let request = DeleteTransactionRequest(
            budgetId: budgetId,
            transactionId: transactionId
        )
        let response: DeleteTransactionResponse = try await client.request(request)
        return response.transaction
    }
}
