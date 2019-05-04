//
//  Service.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Super class for all services
public class Service {
    
    var client: Client
    
    required init(with client: Client) {
        self.client = client
    }
    
}
