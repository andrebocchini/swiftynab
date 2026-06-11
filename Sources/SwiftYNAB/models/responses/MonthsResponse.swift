//
//  MonthsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the months in a plan
public struct MonthsResponse: Equatable, Sendable {
    /// The requested months
    public let months: [MonthSummary]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(months: [MonthSummary], serverKnowledge: ServerKnowledge) {
        self.months = months
        self.serverKnowledge = serverKnowledge
    }
}
