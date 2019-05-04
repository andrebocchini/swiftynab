//
//  PayeeLocationService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee location operations
public class PayeeLocationService: Service {

    /**
     Returns a list of all payee locations.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of payee locations, and the second parameter contains any errors encountered during retrieval.
     */
    public func getPayeeLocations(budgetId: String,
                                  completion: @escaping ([PayeeLocation]?, ErrorDetail?) -> Void) {
        let request = PayeeLocationsRequest(budgetId: budgetId)
        self.client.request(request) {
            (response: PayeeLocationsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.payeeLocations, error)
        }
    }
    
    /**
     Returns a single payee location.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - payeeId: The id of the payee
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     payee locations, and the second parameter contains any errors encountered during retrieval.
     */
    public func getPayeeLocation(budgetId: String,
                                 payeeId: String,
                                 completion: @escaping (PayeeLocation?, ErrorDetail?) -> Void) {
        let request = PayeeLocationRequest(budgetId: budgetId, payeeId: payeeId)
        self.client.request(request) {
            (response: PayeeLocationResponse?, error: ErrorDetail?) in
            
            completion(response?.data.payeeLocation, error)
        }
    }
    
    /**
     Returns all locations for a payee.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - payeeId: The id of the payee
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     list of payee locations, and the second parameter contains any errors encountered during retrieval.
     */
    public func getLocationsForPayee(budgetId: String,
                                     payeeId: String,
                                     completion: @escaping ([PayeeLocation]?, ErrorDetail?) -> Void) {
        let request = LocationsForPayeeRequest(budgetId: budgetId, payeeId: payeeId)
        self.client.request(request) {
            (response: PayeeLocationsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.payeeLocations, error)
        }
    }
    
}
