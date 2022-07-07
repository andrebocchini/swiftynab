//
//  LocationsForPayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct LocationsForPayeeRequest {
    let budgetId: String
    let payeeId: String
}

extension LocationsForPayeeRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payees/\(payeeId)/payee_locations"
    }
}
