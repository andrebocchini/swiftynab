//
//  DeleteScheduledTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct DeleteScheduledTransactionRequest {
    let budgetId: String
    let scheduledTransactionId: String
}

extension DeleteScheduledTransactionRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/scheduled_transactions/\(scheduledTransactionId)"
    }

    var method: RequestMethod {
        .delete
    }
}

extension DeleteScheduledTransactionRequest {
    struct Response: Decodable {
        let scheduledTransaction: ScheduledTransactionDetail
    }
}
