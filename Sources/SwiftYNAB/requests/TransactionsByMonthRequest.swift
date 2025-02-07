//
//  TransactionsByMonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByMonthRequest {
    let budgetId: String
    let month: Date
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        budgetId: String,
        month: Date,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.budgetId = budgetId
        self.month = month
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByMonthRequest: Request {
    var path: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let monthString = dateFormatter.string(from: month)
        return "/v1/budgets/\(budgetId)/months/\(monthString)/transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension TransactionsByMonthRequest {
    struct Response: Decodable {
        let transactions: [HybridTransaction]
        let serverKnowledge: ServerKnowledge
    }
}
