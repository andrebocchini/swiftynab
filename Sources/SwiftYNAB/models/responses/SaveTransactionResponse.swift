//
//  SaveTransactionResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when creating a single transaction
public struct SaveTransactionResponse: Equatable, Sendable {
    /// The created transaction, if available
    public let transaction: TransactionDetail?

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(transaction: TransactionDetail?, serverKnowledge: ServerKnowledge) {
        self.transaction = transaction
        self.serverKnowledge = serverKnowledge
    }
}
