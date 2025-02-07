//
//  ImportTransactionsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct ImportTransactionsRequest {
    let budgetId: String
}

extension ImportTransactionsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/transactions/import"
    }

    var method: RequestMethod {
        .post
    }
}

extension ImportTransactionsRequest {
    struct Response: Decodable {
        let transactionIds: [String]
    }
}
