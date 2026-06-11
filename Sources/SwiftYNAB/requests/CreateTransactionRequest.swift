//
//  CreateTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreateTransactionRequest {
    let planId: String
    let transaction: NewTransaction
}

extension CreateTransactionRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var method: RequestMethod {
        .post
    }

    func body(using serializer: SerializerType) throws -> Data? {
        try serializer.encode(CreateTransactionRequestWrapper(transaction: transaction))
    }

    struct Response: Decodable {
        let serverKnowledge: ServerKnowledge
        let transaction: TransactionDetail?
        let transactionIds: [String]
    }
}

struct CreateTransactionRequestWrapper: Codable {
    let transaction: NewTransaction
}
