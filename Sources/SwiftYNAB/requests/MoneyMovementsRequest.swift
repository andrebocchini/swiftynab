//
//  MoneyMovementsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct MoneyMovementsRequest {
    let planId: String
}

extension MoneyMovementsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/money_movements"
    }
}

extension MoneyMovementsRequest {
    struct Response: Decodable {
        let moneyMovements: [MoneyMovement]
        let serverKnowledge: ServerKnowledge
    }
}
