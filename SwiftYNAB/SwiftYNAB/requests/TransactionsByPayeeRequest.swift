//
//  TransactionsByPayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByPayeeRequest {
    let budgetId: String
    let payeeId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: Int?

    init(
        budgetId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: Int? = nil
    ) {
        self.budgetId = budgetId
        self.payeeId = payeeId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByPayeeRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payees/\(payeeId)/transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}
