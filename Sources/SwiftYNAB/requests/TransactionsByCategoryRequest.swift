//
//  TransactionsByCategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByCategoryRequest {
    let planId: String
    let categoryId: String
    let sinceDate: Date?
    let untilDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        planId: String,
        categoryId: String,
        sinceDate: Date? = nil,
        untilDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.planId = planId
        self.categoryId = categoryId
        self.sinceDate = sinceDate
        self.untilDate = untilDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByCategoryRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/categories/\(categoryId)/transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: sinceDate,
            untilDate: untilDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension TransactionsByCategoryRequest {
    struct Response: Decodable {
        let transactions: [HybridTransaction]
        let serverKnowledge: ServerKnowledge?
    }
}
