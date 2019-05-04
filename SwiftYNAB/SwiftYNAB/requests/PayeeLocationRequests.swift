//
//  PayeeLocationRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeLocationsRequest {
    
    let budgetId: String
    
}

extension PayeeLocationsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/payee_locations"
    }
    
}


struct PayeeLocationRequest {
    
    let budgetId: String
    let payeeId: String
    
}

extension PayeeLocationRequest: Request {

    var path: String {
        return "/v1/budgets/\(self.budgetId)/payee_locations/\(self.payeeId)"
    }
    
}


struct LocationsForPayeeRequest {
    
    let budgetId: String
    let payeeId: String
    
}

extension LocationsForPayeeRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/payees/\(self.payeeId)/payee_locations"
    }
    
}
