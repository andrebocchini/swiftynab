//
//  CategoryRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct CategoryRequest {
    let budgetId: String
    let categoryId: String
}

extension CategoryRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/categories/\(categoryId)"
    }
}

extension CategoryRequest {
    struct Response: Decodable {
        let category: Category
    }
}
