//
//  CreateCategoryGroupRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct CreateCategoryGroupRequest {
    let budgetId: String
    let categoryGroup: SaveCategoryGroup
}

extension CreateCategoryGroupRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/category_groups"
    }

    var method: RequestMethod {
        .post
    }

    var body: Data? {
        let wrapper = PostCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct PostCategoryGroupWrapper: Codable, Equatable {
    let categoryGroup: SaveCategoryGroup
}

extension CreateCategoryGroupRequest {
    struct Response: Decodable {
        let categoryGroup: CategoryGroup
        let serverKnowledge: ServerKnowledge
    }
}
