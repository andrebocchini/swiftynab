//
//  Response.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

struct Response<T> where T: Decodable, T: Sendable {
    let data: T
}

extension Response: Decodable, Sendable {}
