//
//  SerializerType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol SerializerType {
    func decode<T: Codable>(_: T.Type, from data: Data) throws -> T
    func encode<T: Codable>(_ model: T) throws -> Data
}
