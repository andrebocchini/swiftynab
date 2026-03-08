//
//  UpdateCategoryGroupRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

struct UpdateCategoryGroupRequest {
    let budgetId: String
    let categoryGroupId: String
    let categoryGroup: SaveCategoryGroup
}

extension UpdateCategoryGroupRequest: Request {
    var path: String {
        "/v1/budgets/\(budgetId)/category_groups/\(categoryGroupId)"
    }

    var method: RequestMethod {
        .patch
    }

    var body: Data? {
        let wrapper = PatchCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        return try? serializer.encode(wrapper)
    }
}

struct PatchCategoryGroupWrapper: Codable, Equatable {
    let categoryGroup: SaveCategoryGroup
}

extension UpdateCategoryGroupRequest {
    struct Response: Decodable {
        let categoryGroup: CategoryGroup
        let serverKnowledge: ServerKnowledge
    }
}
