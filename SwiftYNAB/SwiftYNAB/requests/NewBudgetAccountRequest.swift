//
//  NewBudgetAccountRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct NewBudgetAccountRequest {
    let budgetId: String
    let name: String
    let type: String
    let balance: Int
}

extension NewBudgetAccountRequest {
    struct Body: Codable {
        struct Account: Codable {
            let name: String
            let type: String
            let balance: Int
        }

        let account: Account

        init(name: String, type: String, balance: Int) {
            account = Account(name: name, type: type, balance: balance)
        }
    }
}

extension NewBudgetAccountRequest: Request {
    var method: RequestMethod {
        .post
    }

    var path: String {
        "/v1/budgets/\(budgetId)/accounts"
    }

    var body: Data? {
        let body = Body(name: name, type: type, balance: balance)
        return try? Serializer.shared.encode(body)
    }
}
