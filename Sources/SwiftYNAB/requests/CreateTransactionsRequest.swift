//
//  CreateTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreateTransactionsRequest {
    let planId: String
    let transactions: [NewTransaction]
}

extension CreateTransactionsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var method: RequestMethod {
        .post
    }

    func body(using serializer: SerializerType) throws -> Data? {
        try serializer.encode(CreateTransactionsRequestWrapper(transactions: transactions))
    }

    struct Response: Decodable {
        let duplicateImportIds: [String]?
        let serverKnowledge: ServerKnowledge
        let transactions: [TransactionDetail]?
        let transactionIds: [String]
    }
}

struct CreateTransactionsRequestWrapper: Codable {
    let transactions: [NewTransaction]
}
