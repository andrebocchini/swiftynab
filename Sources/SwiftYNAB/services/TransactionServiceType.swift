//
//  TransactionServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to transaction operations
public protocol TransactionServiceType: Sendable {
    /// Returns a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan).
    ///    - transactionId: Id of the transaction.
    ///
    /// - Returns: A single transaction and the knowledge of the server
    func transaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionResponse

    /// Returns all transactions for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - sinceDate: If specified, only transactions on or after this date will be included. If
    /// omitted, the API defaults to one year ago.
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions and the knowledge of the server
    func transactions(
        planId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse

    /// Returns transactions for a plan matching the supplied query.
    func transactions(
        planId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse

    /// Returns all transactions for an account in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - accountId: The id of the account.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. If
    /// omitted, the API defaults to one year ago.
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of transactions and the knowledge of the server
    func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse

    /// Returns transactions for an account matching the supplied query.
    func transactions(
        planId: String,
        accountId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse

    /// Returns all transactions for a category in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryId: The id of the category.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. If
    /// omitted, the API defaults to one year ago.
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of hybrid transactions and the optional knowledge of the server
    func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse

    /// Returns transactions for a category matching the supplied query.
    func transactions(
        planId: String,
        categoryId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse

    /// Returns all transactions for a payee in a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee.
    ///    - sinceDate: If specified, only transactions on or after this date will be included. If
    /// omitted, the API defaults to one year ago.
    ///    - type: If specified, only transactions of the specified type will be included.
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A list of hybrid transactions and the optional knowledge of the server
    func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> HybridTransactionsResponse

    /// Returns transactions for a payee matching the supplied query.
    func transactions(
        planId: String,
        payeeId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse

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
    /// - Returns: A list of transactions and the knowledge of the server
    func transactions(
        planId: String,
        month: Date,
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> TransactionsResponse

    /// Returns transactions for a month matching the supplied query.
    func transactions(
        planId: String,
        month: Date,
        query: TransactionQuery
    ) async throws -> TransactionsResponse

    /// Creates a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transaction: The transaction data to create
    ///
    /// - Returns: The created transaction and the knowledge of the server
    func createTransaction(
        planId: String,
        transaction: NewTransaction
    ) async throws -> SaveTransactionResponse

    /// Creates multiple transactions.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactions: An array of transaction data to create
    ///
    /// - Returns: The created transactions, the knowledge of the server, and duplicate
    /// import ids
    func createTransactions(
        planId: String,
        transactions: [NewTransaction]
    ) async throws -> SaveTransactionsResponse

    /// Updates multiple transactions.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactions: An array of transaction data to update
    ///
    /// - Returns: The updated transactions, the knowledge of the server, and duplicate
    /// import ids
    func updateTransactions(
        planId: String,
        transactions: [SaveTransactionWithIdOrImportId]
    ) async throws -> SaveTransactionsResponse

    /// Updates a single transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the transaction to update
    ///    - transaction: The transaction data to update
    ///
    /// - Returns: The updated transaction and the knowledge of the server
    func updateTransaction(
        planId: String,
        transactionId: String,
        transaction: ExistingTransaction
    ) async throws -> TransactionResponse

    /// Imports transactions that have been uploaded via file-based import.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: An array of transaction ids for the imported transactions
    func importTransactions(planId: String) async throws -> [String]

    /// Deletes a transaction.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - transactionId: The id of the transaction to delete
    ///
    /// - Returns: The deleted transaction and the knowledge of the server
    func deleteTransaction(
        planId: String,
        transactionId: String
    ) async throws -> TransactionResponse
}

public extension TransactionServiceType {
    /// Returns all transactions for a plan, with optional parameters defaulted.
    func transactions(
        planId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }

    /// Returns all transactions for an account in a plan, with optional parameters defaulted.
    func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            accountId: accountId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }

    /// Returns all transactions for a category in a plan, with optional parameters defaulted.
    func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            categoryId: categoryId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }

    /// Returns all transactions for a payee in a plan, with optional parameters defaulted.
    func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            payeeId: payeeId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }

    /// Returns all transactions for a specific month, with optional parameters defaulted.
    func transactions(
        planId: String,
        month: Date,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            month: month,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }

    /// Returns all transactions for a plan matching the supplied query.
    func transactions(
        planId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let response = try await transactions(
            planId: planId,
            sinceDate: query.sinceDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        return TransactionsResponse(
            transactions: filteredTransactions(
                response.transactions,
                onOrBefore: query.untilDate
            ),
            serverKnowledge: response.serverKnowledge
        )
    }

    /// Returns all transactions for an account matching the supplied query.
    func transactions(
        planId: String,
        accountId: String,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let response = try await transactions(
            planId: planId,
            accountId: accountId,
            sinceDate: query.sinceDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        return TransactionsResponse(
            transactions: filteredTransactions(
                response.transactions,
                onOrBefore: query.untilDate
            ),
            serverKnowledge: response.serverKnowledge
        )
    }

    /// Returns all transactions for a category matching the supplied query.
    func transactions(
        planId: String,
        categoryId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse {
        let response = try await transactions(
            planId: planId,
            categoryId: categoryId,
            sinceDate: query.sinceDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        return HybridTransactionsResponse(
            transactions: filteredTransactions(
                response.transactions,
                onOrBefore: query.untilDate
            ),
            serverKnowledge: response.serverKnowledge
        )
    }

    /// Returns all transactions for a payee matching the supplied query.
    func transactions(
        planId: String,
        payeeId: String,
        query: TransactionQuery
    ) async throws -> HybridTransactionsResponse {
        let response = try await transactions(
            planId: planId,
            payeeId: payeeId,
            sinceDate: query.sinceDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        return HybridTransactionsResponse(
            transactions: filteredTransactions(
                response.transactions,
                onOrBefore: query.untilDate
            ),
            serverKnowledge: response.serverKnowledge
        )
    }

    /// Returns all transactions for a month matching the supplied query.
    func transactions(
        planId: String,
        month: Date,
        query: TransactionQuery
    ) async throws -> TransactionsResponse {
        let response = try await transactions(
            planId: planId,
            month: month,
            sinceDate: query.sinceDate,
            type: query.type,
            lastKnowledgeOfServer: query.lastKnowledgeOfServer
        )
        return TransactionsResponse(
            transactions: filteredTransactions(
                response.transactions,
                onOrBefore: query.untilDate
            ),
            serverKnowledge: response.serverKnowledge
        )
    }

    /// Returns all transactions for a plan through an inclusive end date.
    func transactions(
        planId: String,
        sinceDate: Date? = nil,
        untilDate: Date,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                untilDate: untilDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    /// Returns all transactions for an account through an inclusive end date.
    func transactions(
        planId: String,
        accountId: String,
        sinceDate: Date? = nil,
        untilDate: Date,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            accountId: accountId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                untilDate: untilDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    /// Returns all transactions for a category through an inclusive end date.
    func transactions(
        planId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        untilDate: Date,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            categoryId: categoryId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                untilDate: untilDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    /// Returns all transactions for a payee through an inclusive end date.
    func transactions(
        planId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        untilDate: Date,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> HybridTransactionsResponse {
        try await transactions(
            planId: planId,
            payeeId: payeeId,
            query: TransactionQuery(
                sinceDate: sinceDate,
                untilDate: untilDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }

    /// Returns all transactions for a month through an inclusive end date.
    func transactions(
        planId: String,
        month: Date,
        sinceDate: Date? = nil,
        untilDate: Date,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> TransactionsResponse {
        try await transactions(
            planId: planId,
            month: month,
            query: TransactionQuery(
                sinceDate: sinceDate,
                untilDate: untilDate,
                type: type,
                lastKnowledgeOfServer: lastKnowledgeOfServer
            )
        )
    }
}

private func filteredTransactions(
    _ transactions: [TransactionDetail],
    onOrBefore untilDate: Date?
) -> [TransactionDetail] {
    guard let untilDate else {
        return transactions
    }

    let untilDateString = DateConverter.iso8601DateString(from: untilDate)
    return transactions.filter { $0.date <= untilDateString }
}

private func filteredTransactions(
    _ transactions: [HybridTransaction],
    onOrBefore untilDate: Date?
) -> [HybridTransaction] {
    guard let untilDate else {
        return transactions
    }

    let untilDateString = DateConverter.iso8601DateString(from: untilDate)
    return transactions.filter { $0.date <= untilDateString }
}
