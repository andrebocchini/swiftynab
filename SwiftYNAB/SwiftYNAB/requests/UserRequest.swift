//
//  UserRequest.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct UserRequest {}

extension UserRequest: Request {
    var path: String {
        "/v1/user"
    }
}
