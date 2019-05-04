//
//  UserService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to user operations
public class UserService: Service {
    
    /**
     Returns authenticated user information
     
     - Parameters:
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     user information, and the second parameter contains any errors encountered during retrieval.
     */
    public func getUser(completion: @escaping (User?, ErrorDetail?) -> Void) {
        let request = UserRequest()
        self.client.request(request) {
            (response: UserResponse?, error: ErrorDetail?) in
            
            completion(response?.data.user, error)
        }
    }
    
}
