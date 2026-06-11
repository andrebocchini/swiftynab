//
//  UpdateTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdateTransactionsRequest {
    let planId: String
    let transactions: [SaveTransactionWithIdOrImportId]
}

extension UpdateTransactionsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var method: RequestMethod {
        .patch
    }

    func body(using serializer: SerializerType) throws -> Data? {
        try serializer.encode(UpdateTransactionsRequestWrapper(transactions: transactions))
    }

    struct Response: Decodable {
        let duplicateImportIds: [String]?
        let serverKnowledge: ServerKnowledge
        let transactions: [TransactionDetail]?
        let transactionIds: [String]
    }
}

struct UpdateTransactionsRequestWrapper: Codable {
    let transactions: [SaveTransactionWithIdOrImportId]
}
