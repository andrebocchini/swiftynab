//
//  TransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionRequest {
    let planId: String
    let transactionId: String
}

extension TransactionRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions/\(transactionId)"
    }
}

extension TransactionRequest {
    struct Response: Decodable {
        let transaction: TransactionDetail
        let serverKnowledge: ServerKnowledge
    }
}
