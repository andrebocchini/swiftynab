//
//  PayeeLocationsRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeLocationsRequest {
    let planId: String
}

extension PayeeLocationsRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/payee_locations"
    }
}

extension PayeeLocationsRequest {
    struct Response: Decodable {
        let payeeLocations: [PayeeLocation]
    }
}
