//
//  Response.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct Response<T: Codable> {
    let data: T
}

extension Response: Codable {}
