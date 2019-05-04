//
//  PayeeResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct PayeesResponse: Codable {
    
    let data: PayeesWrapper
    
    struct PayeesWrapper: Codable {
        
        let payees: [Payee]
        let serverKnowledge: Int
        
    }
    
}


struct PayeeResponse: Codable {
    
    let data: PayeeWrapper
 
    struct PayeeWrapper: Codable {
        
        let payee: Payee
        
    }
    
}
