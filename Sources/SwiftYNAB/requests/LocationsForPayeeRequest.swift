//
//  LocationsForPayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct LocationsForPayeeRequest {
    let planId: String
    let payeeId: String
}

extension LocationsForPayeeRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/payees/\(payeeId)/payee_locations"
    }
}

extension LocationsForPayeeRequest {
    struct Response: Decodable {
        let payeeLocations: [PayeeLocation]
    }
}
