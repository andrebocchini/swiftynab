//
//  CreateCategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreateCategoryRequest {
    let budgetId: String
    let category: SaveCategory
}

extension CreateCategoryRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/categories"
    }

    var method: RequestMethod {
        .post
    }

    var body: Data? {
        let wrapper = PostCategoryWrapper(category: category)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct PostCategoryWrapper: Codable, Equatable {
    let category: SaveCategory

    init(category: SaveCategory) {
        self.category = category
    }
}

extension CreateCategoryRequest {
    struct Response: Decodable {
        let category: Category
        let serverKnowledge: ServerKnowledge
    }
}
