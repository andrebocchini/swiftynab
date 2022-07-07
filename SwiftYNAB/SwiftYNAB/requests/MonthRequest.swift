//
//  MonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct MonthRequest {
    let budgetId: String
    let month: String
}

extension MonthRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/months/\(month)"
    }
}
