//
//  ScheduledTransactionsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the scheduled transactions in a plan
public struct ScheduledTransactionsResponse: Equatable, Sendable {
    /// The requested scheduled transactions
    public let scheduledTransactions: [ScheduledTransactionDetail]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(
        scheduledTransactions: [ScheduledTransactionDetail],
        serverKnowledge: ServerKnowledge
    ) {
        self.scheduledTransactions = scheduledTransactions
        self.serverKnowledge = serverKnowledge
    }
}
