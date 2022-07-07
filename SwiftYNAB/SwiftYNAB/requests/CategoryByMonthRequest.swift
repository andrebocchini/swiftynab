//
//  CategoryByMonthRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct CategoryByMonthRequest {
    let budgetId: String
    let month: String
    let categoryId: String
}

extension CategoryByMonthRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/months/\(month)/categories/\(categoryId)"
    }
}
