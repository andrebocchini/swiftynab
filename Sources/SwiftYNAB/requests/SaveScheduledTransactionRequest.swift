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
    let scheduledTransactionId: String?

    init(
        budgetId: String,
        transaction: SaveScheduledTransaction,
        update: Bool = false,
        scheduledTransactionId: String? = nil
    ) {
        precondition(!update || scheduledTransactionId != nil,
                     "scheduledTransactionId is required when update is true")
        self.budgetId = budgetId
        self.transaction = transaction
        self.update = update
        self.scheduledTransactionId = scheduledTransactionId
    }
}

extension SaveScheduledTransactionRequest: Request {
    var path: String {
        if update, let scheduledTransactionId {
            "/v1/budgets/\(budgetId)/scheduled_transactions/\(scheduledTransactionId)"
        } else {
            "/v1/budgets/\(budgetId)/scheduled_transactions"
        }
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
