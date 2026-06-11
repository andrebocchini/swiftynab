//
//  HybridTransactionsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching transactions by category or payee
public struct HybridTransactionsResponse: Equatable, Sendable {
    /// The requested transactions
    public let transactions: [HybridTransaction]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge?

    public init(transactions: [HybridTransaction], serverKnowledge: ServerKnowledge?) {
        self.transactions = transactions
        self.serverKnowledge = serverKnowledge
    }
}
