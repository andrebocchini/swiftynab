//
//  CreateCategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreateCategoryRequest {
    let planId: String
    let category: NewCategory
}

extension CreateCategoryRequest: Request {
    var path: String {
        "/v1/plans/\(planId)/categories"
    }

    var method: RequestMethod {
        .post
    }

    func body(using serializer: SerializerType) throws -> Data? {
        let wrapper = NewCategoryWrapper(with: category)
        return try serializer.encode(wrapper)
    }
}

struct NewCategoryWrapper: Codable, Equatable {
    var category: NewCategory

    init(with category: NewCategory) {
        self.category = category
    }
}

extension CreateCategoryRequest {
    struct Response: Decodable {
        let category: Category
        let serverKnowledge: ServerKnowledge
    }
}
