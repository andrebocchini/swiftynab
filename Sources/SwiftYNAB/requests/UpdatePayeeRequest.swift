//
//  UpdatePayeeRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdatePayeeRequest {
    let budgetId: String
    let payeeId: String
    let payee: SavePayee
}

extension UpdatePayeeRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/payees/\(payeeId)"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let wrapper = SavePayeeWrapper(with: payee)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct SavePayeeWrapper: Codable {
    var payee: SavePayee

    init(with payee: SavePayee) {
        self.payee = payee
    }
}

extension UpdatePayeeRequest {
    struct Response: Decodable {
        let payee: Payee
        let serverKnowledge: ServerKnowledge
    }
}
