//
//  UpdateTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

public struct UpdateTransactionsRequest {
    public let budgetId: String
    public let transactions: [SaveTransactionWithIdOrImportId]
}

extension UpdateTransactionsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let serializer = Serializer()
        return try? serializer.encode(UpdateTransactionsRequestWrapper(transactions: transactions))
    }

    struct Response: Decodable {
        let duplicateImportIds: [String]
        let serverKnowledge: ServerKnowledge
        let transactions: [TransactionDetail]
        let transactionIds: [String]
    }
}

struct UpdateTransactionsRequestWrapper: Codable {
    let transactions: [SaveTransactionWithIdOrImportId]
}
