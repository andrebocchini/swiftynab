//
//  UpdateTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdateTransactionRequest {
    let planId: String
    let transactionId: String
    let transaction: ExistingTransaction
}

extension UpdateTransactionRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions/\(transactionId)"
    }

    var method: RequestMethod {
        .put
    }

    var body: Data? {
        let wrapper = UpdateTransactionRequestWrapper(with: transaction)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct UpdateTransactionRequestWrapper: Codable {
    var transaction: ExistingTransaction

    init(with transaction: ExistingTransaction) {
        self.transaction = transaction
    }
}

extension UpdateTransactionRequest {
    struct Response: Decodable {
        let serverKnowledge: ServerKnowledge
        let transaction: TransactionDetail
    }
}
