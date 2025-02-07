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
    let type: AccountType
    let balance: Int
}

extension NewBudgetAccountRequest {
    struct Body: Codable {
        struct Account: Codable {
            let name: String
            let type: AccountType
            let balance: Int
        }

        let account: Account

        init(name: String, type: AccountType, balance: Int) {
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
        let serializer = Serializer()
        return try? serializer.encode(body)
    }
}

extension NewBudgetAccountRequest {
    struct Response: Decodable {
        let account: Account
    }
}
