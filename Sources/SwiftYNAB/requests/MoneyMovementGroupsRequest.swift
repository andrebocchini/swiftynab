//
//  MoneyMovementGroupsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct MoneyMovementGroupsRequest {
    let planId: String
}

extension MoneyMovementGroupsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/money_movement_groups"
    }
}

extension MoneyMovementGroupsRequest {
    struct Response: Decodable {
        let moneyMovementGroups: [MoneyMovementGroup]
        let serverKnowledge: ServerKnowledge
    }
}
