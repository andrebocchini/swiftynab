//
//  PayeeResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when creating or updating a payee
public struct PayeeResponse: Equatable, Sendable {
    /// The created or updated payee
    public let payee: Payee

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(payee: Payee, serverKnowledge: ServerKnowledge) {
        self.payee = payee
        self.serverKnowledge = serverKnowledge
    }
}
