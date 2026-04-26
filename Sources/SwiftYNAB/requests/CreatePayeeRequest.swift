//
//  CreatePayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 4/24/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreatePayeeRequest {
    let planId: String
    let payee: SavePayee
}

extension CreatePayeeRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/payees"
    }

    var method: RequestMethod {
        .post
    }

    var body: Data? {
        let wrapper = SavePayeeWrapper(with: payee)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

extension CreatePayeeRequest {
    struct Response: Decodable {
        let payee: Payee
        let serverKnowledge: ServerKnowledge
    }
}
