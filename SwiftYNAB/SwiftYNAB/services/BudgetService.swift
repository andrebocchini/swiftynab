//
//  BudgetService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to account operations
public class BudgetService: Service {
    
    /**
     Returns budgets list with summary information.
     
     - Parameters:
     - completion: Completion handler which takes in two parameters.  The first parameter takes in
     the returned budget summary information, and the second one takes in any errors that may
     occur during retrieval.
     */
    public func getBudgets(completion: @escaping ([BudgetSummary]?, ErrorDetail?) -> Void) {
        let request = BudgetSummaryRequest()
        self.client.request(request) {
            (response: BudgetSummaryResponse?, error: ErrorDetail?) in
            
            completion(response?.data.budgets, error)
        }
    }
    
    
    /**
     Returns a single budget with all related entities.
     
     This resource is effectively a full budget export.  Depending on the size of your budget,
     this request can take a while.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
     have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler which takes in two parameters.  The first parameter takes in
     the returned budget information, and the second one takes in any errors that may occur
     during retrieval.
     */
    public func getBudget(budgetId: String,
                          lastKnowledgeOfServer: Int? = nil,
                          completion: @escaping (BudgetDetail?, ErrorDetail?) -> Void) {
        let request = BudgetDetailRequest(budgetId: budgetId, lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: BudgetDetailResponse?, error: ErrorDetail?) in
            
            completion(response?.data.budget, error)
        }
    }
    
    /**
     Returns settings for a budget.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     budget settings, and the second parameter contains any errors encountered during retrieval.
     */
    public func getBudgetSettings(budgetId: String,
                                  completion: @escaping (BudgetSettings?, ErrorDetail?) -> Void) {
        let request = BudgetSettingsRequest(budgetId: budgetId)
        self.client.request(request) {
            (response: BudgetSettingsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.settings, error)
        }
    }
    
}
