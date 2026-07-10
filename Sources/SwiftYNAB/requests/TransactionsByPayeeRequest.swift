//
//  TransactionsByPayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByPayeeRequest {
    let planId: String
    let payeeId: String
    let sinceDate: Date?
    let untilDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        planId: String,
        payeeId: String,
        sinceDate: Date? = nil,
        untilDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.planId = planId
        self.payeeId = payeeId
        self.sinceDate = sinceDate
        self.untilDate = untilDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByPayeeRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/payees/\(payeeId)/transactions"
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

extension TransactionsByPayeeRequest {
    struct Response: Decodable {
        let transactions: [HybridTransaction]
        let serverKnowledge: ServerKnowledge?
    }
}
