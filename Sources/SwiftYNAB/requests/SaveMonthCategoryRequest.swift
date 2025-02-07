//
//  SaveMonthCategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct SaveMonthCategoryRequest {
    let budgetId: String
    let month: String
    let categoryId: String
    let budgeted: Int
}

extension SaveMonthCategoryRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/months/\(month)/categories/\(categoryId)"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let categoryUpdate = SaveMonthCategory(budgeted: budgeted)
        let wrapper = SaveMonthCategoryRequestWrapper(with: categoryUpdate)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct SaveMonthCategoryRequestWrapper: Codable {
    let category: SaveMonthCategory

    init(with category: SaveMonthCategory) {
        self.category = category
    }
}

extension SaveMonthCategoryRequest {
    struct Response: Decodable {
        let category: Category
    }
}
