//
//  TransactionsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching a list of transactions
public struct TransactionsResponse: Equatable, Sendable {
    /// The requested transactions
    public let transactions: [TransactionDetail]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(transactions: [TransactionDetail], serverKnowledge: ServerKnowledge) {
        self.transactions = transactions
        self.serverKnowledge = serverKnowledge
    }
}
