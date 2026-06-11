//
//  PayeesResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the payees in a plan
public struct PayeesResponse: Equatable, Sendable {
    /// The requested payees
    public let payees: [Payee]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(payees: [Payee], serverKnowledge: ServerKnowledge) {
        self.payees = payees
        self.serverKnowledge = serverKnowledge
    }
}
