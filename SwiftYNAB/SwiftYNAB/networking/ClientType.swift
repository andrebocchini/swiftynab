//
//  ClientType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol ClientType {
    func request<T: Codable>(_ request: Request) async throws -> T
}
