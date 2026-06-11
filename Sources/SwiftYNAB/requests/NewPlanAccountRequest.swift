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
    let type: SaveAccountType
    let balance: Int
}

extension NewPlanAccountRequest {
    struct PostAccountWrapper: Codable, Equatable {
        struct Account: Codable, Equatable {
            let name: String
            let type: SaveAccountType
            let balance: Int
        }

        let account: Account

        init(name: String, type: SaveAccountType, balance: Int) {
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

    func body(using serializer: SerializerType) throws -> Data? {
        let body = PostAccountWrapper(name: name, type: type, balance: balance)
        return try serializer.encode(body)
    }
}

extension NewPlanAccountRequest {
    struct Response: Decodable {
        let account: Account
    }
}
