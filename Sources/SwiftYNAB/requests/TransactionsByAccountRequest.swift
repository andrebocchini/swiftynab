//
//  TransactionsByAccountRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionsByAccountRequest {
    let planId: String
    let accountId: String
    let sinceDate: Date?
    let untilDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: ServerKnowledge?

    init(
        planId: String,
        accountId: String,
        sinceDate: Date? = nil,
        untilDate: Date? = nil,
        type: TransactionType? = nil,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) {
        self.planId = planId
        self.accountId = accountId
        self.sinceDate = sinceDate
        self.untilDate = untilDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension TransactionsByAccountRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/accounts/\(accountId)/transactions"
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

extension TransactionsByAccountRequest {
    struct Response: Decodable {
        let transactions: [TransactionDetail]
        let serverKnowledge: ServerKnowledge
    }
}
