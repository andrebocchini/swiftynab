//
//  UpdateCategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdateCategoryRequest {
    let budgetId: String
    let categoryId: String
    let category: SaveCategory
}

extension UpdateCategoryRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/categories/\(categoryId)"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let wrapper = SaveCategoryWrapper(with: category)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct SaveCategoryWrapper: Codable {
    var category: SaveCategory

    init(with category: SaveCategory) {
        self.category = category
    }
}

extension UpdateCategoryRequest {
    struct Response: Decodable {
        let category: Category
        let serverKnowledge: ServerKnowledge
    }
}
