//
//  MonthService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to month operations
public class MonthService: Service {
    
    /**
     Returns a list of budget months.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of months, and the second parameter contains any errors encountered during retrieval.
     */
    public func getMonths(budgetId: String,
                          lastKnowledgeOfServer: Int? = nil,
                          completion: @escaping ([MonthSummary]?, ErrorDetail?) -> Void) {
        let request = MonthsRequest(budgetId: budgetId, lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: MonthsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.months, error)
        }
    }
    
    /**
     Returns a single month.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - month: The budget month in ISO format (e.g. 2016-12-01) (*current* can also be used to specify
     the current calendar month (UTC))
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     month, and the second parameter contains any errors encountered during retrieval.
     */
    public func getMonth(budgetId: String,
                         month: String,
                         completion: @escaping (MonthDetail?, ErrorDetail?) -> Void) {
        let request = MonthRequest(budgetId: budgetId, month: month)
        self.client.request(request) {
            (response: MonthResponse?, error: ErrorDetail?) in
            
            completion(response?.data.month, error)
        }
    }
    
}
