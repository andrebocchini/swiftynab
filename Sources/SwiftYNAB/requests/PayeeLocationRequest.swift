//
//  PayeeLocationRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeLocationRequest {
    let budgetId: String
    let payeeLocationId: String
}

extension PayeeLocationRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payee_locations/\(payeeLocationId)"
    }
}

extension PayeeLocationRequest {
    struct Response: Decodable {
        let payeeLocation: PayeeLocation
    }
}
