//
//  PlanDetailRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PlanDetailRequest {
    let planId: String
    let lastKnowledgeOfServer: ServerKnowledge?

    init(planId: String, lastKnowledgeOfServer: ServerKnowledge? = nil) {
        self.planId = planId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
}

extension PlanDetailRequest: Request {
    var path: String {
        "/v1/plans/\(planId)"
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

extension PlanDetailRequest {
    struct Response: Decodable {
        let plan: PlanDetail
        let serverKnowledge: ServerKnowledge

        init(plan: PlanDetail, serverKnowledge: ServerKnowledge) {
            self.plan = plan
            self.serverKnowledge = serverKnowledge
        }

        @available(*, deprecated, renamed: "plan")
        var budget: PlanDetail {
            plan
        }

        @available(*, deprecated, renamed: "init(plan:serverKnowledge:)")
        init(budget: PlanDetail, serverKnowledge: ServerKnowledge) {
            self.init(plan: budget, serverKnowledge: serverKnowledge)
        }
    }
}
