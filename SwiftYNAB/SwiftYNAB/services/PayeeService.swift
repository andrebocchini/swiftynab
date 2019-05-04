//
//  PayeeService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee operations
public class PayeeService: Service {
    
    /**
     Returns all payees
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
     will be included.
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of payees, and the second parameter contains any errors encountered during retrieval.
    */
    public func getPayees(budgetId: String,
                          lastKnowledgeOfServer: Int? = nil,
                          completion: @escaping ([Payee]?, ErrorDetail?) -> Void) {
        let request = PayeesRequest(budgetId: budgetId, lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: PayeesResponse?, error: ErrorDetail?) in
            
            completion(response?.data.payees, error)
        }
    }
    
    /**
     Returns a single payee
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
     will be included.
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of payees, and the second parameter contains any errors encountered during retrieval.
     */
    public func getPayee(budgetId: String,
                         payeeId: String,
                         completion: @escaping (Payee?, ErrorDetail?) -> Void) {
        let request = PayeeRequest(budgetId: budgetId, payeeId: payeeId)
        self.client.request(request) {
            (response: PayeeResponse?, error: ErrorDetail?) in
            
            completion(response?.data.payee, error)
        }
    }
    
}
