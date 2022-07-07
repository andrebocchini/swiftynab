//
//  SaveTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct SaveTransactionsRequest {
    let budgetId: String
    let transactions: [SaveTransaction]
    let update: Bool

    init(budgetId: String, transactions: [SaveTransaction], update: Bool = false) {
        self.budgetId = budgetId
        self.transactions = transactions
        self.update = update
    }
}

extension SaveTransactionsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions"
    }

    var method: RequestMethod {
        update ? .patch : .post
    }

    var body: Data? {
        let wrapper = SaveTransactionsRequestWrapper(with: transactions)
        return try? Serializer.shared.encode(wrapper)
    }
}

struct SaveTransactionsRequestWrapper: Codable {
    var transactions: [SaveTransaction]

    init(with transactions: [SaveTransaction]) {
        self.transactions = transactions
    }
}
