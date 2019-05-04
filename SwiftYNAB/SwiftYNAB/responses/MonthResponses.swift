//
//  MonthResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct MonthsResponse: Codable {
    
    let data: MonthsWrapper
    
    struct MonthsWrapper: Codable {
        
        let months: [MonthSummary]
        
    }
    
}


struct MonthResponse: Codable {
    
    let data: MonthWrapper
    
    struct MonthWrapper: Codable {
        
        let month: MonthDetail
        
    }
    
}
