//
//  CreateTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

public struct CreateTransactionRequest {
    public let budgetId: String
    public let transaction: SaveTransactionWithIdOrImportId
}

extension CreateTransactionRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions"
    }

    var method: RequestMethod {
        .post
    }

    var body: Data? {
        let serializer = Serializer()
        return try? serializer.encode(CreateTransactionRequestWrapper(transaction: transaction))
    }

    struct Response: Decodable {
        let duplicateImportIds: [String]
        let serverKnowledge: ServerKnowledge
        let transaction: TransactionDetail
        let transactionIds: [String]
    }
}

struct CreateTransactionRequestWrapper: Codable {
    let transaction: SaveTransactionWithIdOrImportId
}
