//
//  SaveTransactionsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when creating or updating multiple transactions
public struct SaveTransactionsResponse: Equatable, Sendable {
    /// The created or updated transactions, if available
    public let transactions: [TransactionDetail]?

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    /// Import ids that were not created because of an existing `importId`
    public let duplicateImportIds: [String]?

    public init(
        transactions: [TransactionDetail]?,
        serverKnowledge: ServerKnowledge,
        duplicateImportIds: [String]?
    ) {
        self.transactions = transactions
        self.serverKnowledge = serverKnowledge
        self.duplicateImportIds = duplicateImportIds
    }
}
