//
//  CategoryRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct CategoriesRequest {

    let budgetId: String
    let lastKnowledgeOfServer: Int?

    init(budgetId: String, lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }

}

extension CategoriesRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/categories"
    }
    
    var query: [URLQueryItem]? {
        guard let lastKnowledgeOfServer = self.lastKnowledgeOfServer else {
            return nil
        }
        
        return [URLQueryItem(name: "last_knowledge_of_server",
                             value: "\(lastKnowledgeOfServer)")]
    }

}


struct CategoryRequest {
    
    let budgetId: String
    let categoryId: String
    
}

extension CategoryRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/categories/\(self.categoryId)"
    }
    
}


struct CategoryByMonthRequest {
    
    let budgetId: String
    let month: String
    let categoryId: String
    
}

extension CategoryByMonthRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/months/\(self.month)/categories/\(self.categoryId)"
    }
    
}


struct SaveMonthCategoryRequest {
    
    let budgetId: String
    let month: String
    let categoryId: String
    let budgeted: Int
    
}

extension SaveMonthCategoryRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/months/\(self.month)/categories/\(self.categoryId)"
    }
    
    var method: String {
        return "PATCH"
    }
    
    var body: Data? {
        let categoryUpdate = SaveMonthCategory(budgeted: self.budgeted)
        let wrapper = SaveMonthCategoryRequestWrapper(with: categoryUpdate)
        return try? Serializer.encode(wrapper)
    }
    
}


struct SaveMonthCategoryRequestWrapper: Codable {
    
    let category: SaveMonthCategory
    
    init(with category: SaveMonthCategory) {
        self.category = category
    }
    
}
