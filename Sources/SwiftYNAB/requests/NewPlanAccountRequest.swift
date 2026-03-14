//
//  NewPlanAccountRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct NewPlanAccountRequest {
    let planId: String
    let name: String
    let type: AccountType
    let balance: Int

    init(planId: String, name: String, type: AccountType, balance: Int) {
        self.planId = planId
        self.name = name
        self.type = type
        self.balance = balance
    }

    @available(*, deprecated, renamed: "init(planId:name:type:balance:)")
    init(budgetId: String, name: String, type: AccountType, balance: Int) {
        self.init(planId: budgetId, name: name, type: type, balance: balance)
    }
}

extension NewPlanAccountRequest {
    struct PostAccountWrapper: Codable, Equatable {
        struct Account: Codable, Equatable {
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

extension NewPlanAccountRequest: Request {
    var method: RequestMethod {
        .post
    }

    var path: String {
        "/v1/plans/\(planId)/accounts"
    }

    var body: Data? {
        let body = PostAccountWrapper(name: name, type: type, balance: balance)
        let serializer = Serializer()
        return try? serializer.encode(body)
    }
}

extension NewPlanAccountRequest {
    struct Response: Decodable {
        let account: Account
    }
}
