//
//  PlanSettingsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PlanSettingsRequest {
    let planId: String
}

extension PlanSettingsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/settings"
    }
}

extension PlanSettingsRequest {
    struct Response: Decodable {
        let settings: PlanSettings
    }
}
