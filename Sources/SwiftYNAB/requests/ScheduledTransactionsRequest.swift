//
//  ScheduledTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct ScheduledTransactionsRequest {
    let budgetId: String
    let lastKnowledgeOfServer: ServerKnowledge?
}

extension ScheduledTransactionsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/scheduled_transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: nil,
            type: nil,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension ScheduledTransactionsRequest {
    struct Response: Decodable {
        let scheduledTransactions: [ScheduledTransactionDetail]
        let serverKnowlege: ServerKnowledge
    }
}
