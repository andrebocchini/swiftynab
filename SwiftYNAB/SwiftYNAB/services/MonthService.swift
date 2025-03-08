//
//  MonthService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to month operations
public class MonthService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension MonthService: MonthServiceType {
    /// Returns a list of budget months.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of months
    public func getMonths(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> [MonthSummary] {
        let request = MonthsRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: MonthsResponse = try await client.request(request)
        return response.months
    }

    /// Returns a specific month for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - month: The budget month in ISO format (e.g. 2016-12-01) (*current* can also be used to specify
    ///    the current calendar month (UTC))
    ///
    /// - Returns: A single month
    public func getMonth(budgetId: String, month: String) async throws -> MonthDetail {
        let request = MonthRequest(budgetId: budgetId, month: month)
        let response: MonthResponse = try await client.request(request)
        return response.month
    }
}
