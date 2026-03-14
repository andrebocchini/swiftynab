//
//  PlanSummaryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PlanSummaryRequest {
    let includeAccounts: Bool
}

extension PlanSummaryRequest: Request {
    var path: String {
        "/v1/plans"
    }

    var query: [URLQueryItem]? {
        [
            URLQueryItem(name: "include_accounts", value: "\(includeAccounts)")
        ]
    }
}

extension PlanSummaryRequest {
    struct Response: Decodable {
        let plans: [PlanSummary]
        let defaultPlan: PlanSummary?

        init(plans: [PlanSummary], defaultPlan: PlanSummary?) {
            self.plans = plans
            self.defaultPlan = defaultPlan
        }

        @available(*, deprecated, renamed: "plans")
        var budgets: [PlanSummary] {
            plans
        }

        @available(*, deprecated, renamed: "defaultPlan")
        var defaultBudget: PlanSummary? {
            defaultPlan
        }

        @available(*, deprecated, renamed: "init(plans:defaultPlan:)")
        init(budgets: [PlanSummary], defaultBudget: PlanSummary?) {
            self.init(plans: budgets, defaultPlan: defaultBudget)
        }
    }
}
