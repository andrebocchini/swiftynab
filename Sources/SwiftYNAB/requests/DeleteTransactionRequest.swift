//
//  DeleteTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 4/12/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import Foundation

struct DeleteTransactionRequest {
    let budgetId: String
    let transactionId: String
}

extension DeleteTransactionRequest {
    struct Body: Codable {
        let budgetId: String
        let transactionId: String
    }
}

extension DeleteTransactionRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions/\(transactionId)"
    }

    var method: RequestMethod {
        .delete
    }

    var body: Data? {
        let body = Body(budgetId: budgetId, transactionId: transactionId)
        let serializer = Serializer()
        return try? serializer.encode(body)
    }
}

extension DeleteTransactionRequest {
    struct Response: Decodable {
        let transaction: TransactionDetail
    }
}
