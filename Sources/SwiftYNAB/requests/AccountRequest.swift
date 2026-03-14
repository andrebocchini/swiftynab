//
//  AccountRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct AccountRequest {
    let planId: String
    let accountId: String
}

extension AccountRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/accounts/\(accountId)"
    }
}

extension AccountRequest {
    struct Response: Decodable {
        let account: Account
    }
}
