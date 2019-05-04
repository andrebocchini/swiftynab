//
//  PayeeLocationResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeeLocationsResponse: Codable {
    
    let data: PayeeLocationsWrapper
    
    struct PayeeLocationsWrapper: Codable {
        
        let payeeLocations: [PayeeLocation]
        
    }
    
}


struct PayeeLocationResponse: Codable {
    
    let data: PayeeLocationWrapper
    
    struct PayeeLocationWrapper: Codable {
        
        let payeeLocation: PayeeLocation
        
    }
    
}
