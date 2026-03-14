//
//  MoneyMovementsByMonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct MoneyMovementsByMonthRequest {
    let planId: String
    let month: String
}

extension MoneyMovementsByMonthRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/months/\(month)/money_movements"
    }
}

extension MoneyMovementsByMonthRequest {
    struct Response: Decodable {
        let moneyMovements: [MoneyMovement]
        let serverKnowledge: ServerKnowledge
    }
}
