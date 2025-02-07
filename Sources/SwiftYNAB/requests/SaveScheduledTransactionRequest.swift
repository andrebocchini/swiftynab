//
//  SaveScheduledTransactionRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct SaveScheduledTransactionRequest {
    let budgetId: String
    let transaction: SaveScheduledTransaction
    let update: Bool

    init(budgetId: String, transaction: SaveScheduledTransaction, update: Bool = false) {
        self.budgetId = budgetId
        self.transaction = transaction
        self.update = update
    }
}

extension SaveScheduledTransactionRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/scheduled_transactions"
    }

    var method: RequestMethod {
        update ? .put : .post
    }

    var body: Data? {
        let wrapper = SaveScheduledTransactionWrapper(with: transaction)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct SaveScheduledTransactionWrapper: Codable {
    var scheduledTransaction: SaveScheduledTransaction

    init(with transaction: SaveScheduledTransaction) {
        scheduledTransaction = transaction
    }
}

extension SaveScheduledTransactionRequest {
    struct Response: Decodable {
        let scheduledTransaction: ScheduledTransactionDetail
    }
}
