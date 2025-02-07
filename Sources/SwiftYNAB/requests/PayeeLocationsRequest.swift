//
//  PayeeLocationsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeLocationsRequest {
    let budgetId: String
}

extension PayeeLocationsRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payee_locations"
    }
}

extension PayeeLocationsRequest {
    struct Response: Decodable {
        let payeeLocations: [PayeeLocation]
    }
}
