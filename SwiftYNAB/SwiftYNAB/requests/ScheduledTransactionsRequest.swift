//
//  ScheduledTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct ScheduledTransactionsRequest {
    let budgetId: String
}

extension ScheduledTransactionsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/scheduled_transactions"
    }
}
