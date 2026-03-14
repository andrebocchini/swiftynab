//
//  MonthsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct MonthsRequest {
    let planId: String
    let lastKnowledgeOfServer: ServerKnowledge?

    init(planId: String, lastKnowledgeOfServer: ServerKnowledge? = nil) {
        self.planId = planId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension MonthsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/months"
    }

    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer
        else {
            return nil
        }

        return [URLQueryItem(
            name: "last_knowledge_of_server",
            value: "\(lastKnowledgeOfServer)"
        )]
    }
}

extension MonthsRequest {
    struct Response: Decodable {
        let months: [MonthSummary]
        let serverKnowledge: ServerKnowledge
    }
}
