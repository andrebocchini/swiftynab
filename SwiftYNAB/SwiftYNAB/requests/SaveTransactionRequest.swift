//
//  SaveTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct SaveTransactionRequest {
    let budgetId: String
    let transaction: SaveTransaction
    let update: Bool

    init(budgetId: String, transaction: SaveTransaction, update: Bool = false) {
        self.budgetId = budgetId
        self.transaction = transaction
        self.update = update
    }
}

extension SaveTransactionRequest: Request {
    var path: String {
        if update,
           let id = transaction.id
        {
            return "/v1/budgets/\(budgetId)/transactions/\(id)"
        } else {
            return "/v1/budgets/\(budgetId)/transactions"
        }
    }

    var method: RequestMethod {
        update ? .put : .post
    }

    var body: Data? {
        let wrapper = SaveTransactionRequestWrapper(with: transaction)
        return try? Serializer.shared.encode(wrapper)
    }
}

struct SaveTransactionRequestWrapper: Codable {
    var transaction: SaveTransaction

    init(with transaction: SaveTransaction) {
        self.transaction = transaction
    }
}
