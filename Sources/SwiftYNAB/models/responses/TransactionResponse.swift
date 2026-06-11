//
//  TransactionResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned by operations on a single transaction
public struct TransactionResponse: Equatable, Sendable {
    /// The requested, updated, or deleted transaction
    public let transaction: TransactionDetail

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(transaction: TransactionDetail, serverKnowledge: ServerKnowledge) {
        self.transaction = transaction
        self.serverKnowledge = serverKnowledge
    }
}
