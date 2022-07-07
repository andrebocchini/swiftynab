//
//  CategoriesResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    let categoryGroups: [CategoryGroupWithCategories]
}
