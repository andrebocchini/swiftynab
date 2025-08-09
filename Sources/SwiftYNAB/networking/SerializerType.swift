//
//  SerializerType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol SerializerType: Sendable {
    func decode<T: Decodable>(_: T.Type, from data: Data) throws -> T
    func encode(_ model: some Encodable) throws -> Data
}
