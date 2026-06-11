//
//  AccountsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the accounts in a plan
public struct AccountsResponse: Equatable, Sendable {
    /// The requested accounts
    public let accounts: [Account]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(accounts: [Account], serverKnowledge: ServerKnowledge) {
        self.accounts = accounts
        self.serverKnowledge = serverKnowledge
    }
}
