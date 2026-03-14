//
//  TransactionsByPlanRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByPlanRequest {
    let planId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        planId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.planId = planId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }

    @available(*, deprecated, renamed: "init(planId:sinceDate:type:lastKnowledgeOfServer:)")
    init(
        budgetId: String,
        sinceDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.init(
            planId: budgetId,
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension TransactionsByPlanRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var query: [URLQueryItem]? {
        TransactionQueryBuilder.buildQuery(
            sinceDate: sinceDate,
            type: type,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
    }
}

extension TransactionsByPlanRequest {
    struct Response: Decodable {
        let transactions: [TransactionDetail]
        let serverKnowledge: ServerKnowledge
    }
}
