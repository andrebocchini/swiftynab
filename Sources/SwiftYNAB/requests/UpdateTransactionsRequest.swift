//
//  UpdateTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

public struct UpdateTransactionsRequest {
    public let planId: String
    public let transactions: [SaveTransactionWithIdOrImportId]
}

extension UpdateTransactionsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/transactions"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let serializer = Serializer()
        return try? serializer.encode(UpdateTransactionsRequestWrapper(transactions: transactions))
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
