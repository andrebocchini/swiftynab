//
//  MonthServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to month operations
public protocol MonthServiceType: Sendable {
    /// Returns a list of plan months.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of months and the knowledge of the server
    func months(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> MonthsResponse

    /// Returns a specific month for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) (*current* can also be used to
    /// specify
    ///    the current calendar month (UTC))
    ///
    /// - Returns: A single month
    func month(planId: String, month: String) async throws -> MonthDetail
}

public extension MonthServiceType {
    /// Returns a list of plan months, with optional parameters defaulted.
    func months(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> MonthsResponse {
        try await months(planId: planId, lastKnowledgeOfServer: lastKnowledgeOfServer)
    }
}
