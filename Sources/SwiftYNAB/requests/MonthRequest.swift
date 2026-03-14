//
//  MonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct MonthRequest {
    let planId: String
    let month: String
}

extension MonthRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/months/\(month)"
    }
}

extension MonthRequest {
    struct Response: Decodable {
        let month: MonthDetail
    }
}
