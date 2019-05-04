//
//  CategoryService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to category operations
public class CategoryService: Service {
    
    /**
     Returns a list of budget categories.
     
     Returns all categories grouped by category group. Amounts (budgeted, activity, balance, etc.)
     are specific to the current budget month (UTC).
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of categories, and the second parameter contains any errors encountered during retrieval.
     */
    public func getCategories(budgetId: String,
                              lastKnowledgeOfServer: Int? = nil,
                              completion: @escaping ([CategoryGroupWithCategories]?, ErrorDetail?) -> Void) {
        let request = CategoriesRequest(budgetId: budgetId, lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: CategoriesResponse?, error: ErrorDetail?) in
            
            completion(response?.data.categoryGroups, error)
        }
    }
    
    /**
     Returns a single category.
     
     Amounts (budgeted, activity, balance, etc.) are specific to the current budget month (UTC).
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     category, and the second parameter contains any errors encountered during retrieval.
     */
    public func getCategory(budgetId: String,
                            categoryId: String,
                            completion: @escaping (Category?, ErrorDetail?) -> Void) {
        let request = CategoryRequest(budgetId: budgetId, categoryId: categoryId)
        self.client.request(request) {
            (response: CategoryResponse?, error: ErrorDetail?) in
            
            completion(response?.data.category, error)
        }
    }
    
    /**
     Returns a single category for a specific budget month
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - month: The budget month in ISO format (e.g. 2016-12-01) (“current” can also be used to
     specify the current calendar month (UTC))
     - categoryId: The id of the category
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     category, and the second parameter contains any errors encountered during retrieval.
     */
    public func getCategory(budgetId: String,
                            month: String,
                            categoryId: String,
                            completion: @escaping (Category?, ErrorDetail?) -> Void) {
        let request = CategoryByMonthRequest(budgetId: budgetId,
                                             month: month,
                                             categoryId: categoryId)
        self.client.request(request) {
            (response: CategoryResponse?, error: ErrorDetail?) in
            
            completion(response?.data.category, error)
        }
    }
    
    /**
     Update a category for a specific month
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - month: The budget month in ISO format (e.g. 2016-12-01) (“current” can also be used to
     specify the current calendar month (UTC))
     - categoryId: The id of the category
     - budgeted: Budgeted amount for the category
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     category, and the second parameter contains any errors encountered during retrieval.
     */
    public func updateCategory(budgetId: String,
                               month: String,
                               categoryId: String,
                               budgeted: Int,
                               completion: @escaping (Category?, ErrorDetail?) -> Void) {
        let request = SaveMonthCategoryRequest(budgetId: budgetId,
                                               month: month,
                                               categoryId: categoryId,
                                               budgeted: budgeted)
        self.client.request(request) {
            (response: CategoryResponse?, error: ErrorDetail?) in
            
            completion(response?.data.category, error)
        }
    }
    
}
