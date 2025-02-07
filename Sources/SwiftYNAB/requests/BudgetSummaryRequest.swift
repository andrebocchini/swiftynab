//
//  BudgetSummaryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct BudgetSummaryRequest {
    let includeAccounts: Bool
}

extension BudgetSummaryRequest: Request {
    var path: String {
        "/v1/budgets"
    }

    var query: [URLQueryItem]? {
        [
            URLQueryItem(name: "include_accounts", value: "\(includeAccounts)")
        ]
    }
}

extension BudgetSummaryRequest {
    struct Response: Decodable {
        let budgets: [BudgetSummary]
        let defaultBudget: BudgetSummary?
    }
}
