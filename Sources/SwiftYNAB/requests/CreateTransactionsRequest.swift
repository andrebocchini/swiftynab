//
//  CreateTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

public struct CreateTransactionsRequest {
    public let planId: String
    public let transactions: [NewTransaction]
}

extension CreateTransactionsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var method: RequestMethod {
        .post
    }

    var body: Data? {
        let serializer = Serializer()
        return try? serializer.encode(CreateTransactionsRequestWrapper(transactions: transactions))
    }

    struct Response: Decodable {
        let duplicateImportIds: [String]
        let serverKnowledge: ServerKnowledge
        let transactions: [TransactionDetail]
        let transactionIds: [String]
    }
}

struct CreateTransactionsRequestWrapper: Codable {
    let transactions: [NewTransaction]
}
