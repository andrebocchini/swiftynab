//
//  ScheduledTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct ScheduledTransactionRequest {
    let planId: String
    let transactionId: String
}

extension ScheduledTransactionRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/scheduled_transactions/\(transactionId)"
    }
}

extension ScheduledTransactionRequest {
    struct Response: Decodable {
        let scheduledTransaction: ScheduledTransactionDetail
    }
}
