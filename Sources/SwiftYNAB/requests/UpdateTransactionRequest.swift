//
//  UpdateTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/21/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdateTransactionRequest {
    let budgetId: String
    let transaction: SaveTransactionWithIdOrImportId
}

extension UpdateTransactionRequest: Request {
    var path: String {
        if let id = transaction.id {
            "/v1/budgets/\(budgetId)/transactions/\(id)"
        } else {
            "/v1/budgets/\(budgetId)/transactions"
        }
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
    var transaction: SaveTransactionWithIdOrImportId

    init(with transaction: SaveTransactionWithIdOrImportId) {
        self.transaction = transaction
    }
}

extension UpdateTransactionRequest {
    struct Response: Decodable {
        let transaction: TransactionDetail
    }
}
