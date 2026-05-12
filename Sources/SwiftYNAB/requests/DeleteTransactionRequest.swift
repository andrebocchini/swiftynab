//
//  DeleteTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 4/12/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import Foundation

struct DeleteTransactionRequest {
    let planId: String
    let transactionId: String
}

extension DeleteTransactionRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions/\(transactionId)"
    }

    var method: RequestMethod {
        .delete
    }
}

extension DeleteTransactionRequest {
    struct Response: Decodable {
        let serverKnowledge: ServerKnowledge
        let transaction: TransactionDetail
    }
}
