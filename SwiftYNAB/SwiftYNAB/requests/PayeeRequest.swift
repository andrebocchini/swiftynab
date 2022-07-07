//
//  PayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeRequest {
    let budgetId: String
    let payeeId: String
}

extension PayeeRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payees/\(payeeId)"
    }
}
