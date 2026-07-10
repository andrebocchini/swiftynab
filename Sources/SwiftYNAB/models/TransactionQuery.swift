//
//  TransactionQuery.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Filters applied when retrieving transactions.
public struct TransactionQuery: Equatable, Sendable {
    /// Only transactions on or after this date are included.
    public let sinceDate: Date?

    /// Only transactions on or before this date are included.
    public let untilDate: Date?

    /// Only transactions of this type are included.
    public let type: TransactionType?

    /// Only entities changed since this server knowledge are included.
    public let lastKnowledgeOfServer: ServerKnowledge?

    public init(
        sinceDate: Date? = nil,
        untilDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.sinceDate = sinceDate
        self.untilDate = untilDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}
