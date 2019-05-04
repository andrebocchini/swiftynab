//
//  CategoryResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    
    let data: CategoryGroupsWrapper
   
    struct CategoryGroupsWrapper: Codable {
        
        let categoryGroups: [CategoryGroupWithCategories]
        
    }
    
}


struct CategoryResponse: Codable {
    
    let data: CategoryWrapper
 
    struct CategoryWrapper: Codable {
        
        let category: Category
        
    }
    
}
