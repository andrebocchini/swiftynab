//
//  MoneyMovementGroupsByMonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct MoneyMovementGroupsByMonthRequest {
    let budgetId: String
    let month: String
}

extension MoneyMovementGroupsByMonthRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/months/\(month)/money_movement_groups"
    }
}

extension MoneyMovementGroupsByMonthRequest {
    struct Response: Decodable {
        let moneyMovementGroups: [MoneyMovementGroup]
        let serverKnowledge: ServerKnowledge
    }
}
