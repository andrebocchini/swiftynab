//
//  BudgetSettingsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct BudgetSettingsRequest {
    let budgetId: String
}

extension BudgetSettingsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/settings"
    }
}
