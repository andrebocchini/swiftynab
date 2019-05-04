//
//  UserResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    
    let data: UserWrapper
 
    struct UserWrapper: Codable {
        
        let user: User
        
    }
    
}
