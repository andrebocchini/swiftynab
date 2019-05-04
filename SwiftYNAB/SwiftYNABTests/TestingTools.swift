//
//  Tools.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

@testable import SwiftYNAB

class TestingTools {
        
    static func loadJSON<T>(for model: T.Type) throws -> Data {
        guard let path = Bundle(for: self).url(forResource: "\(T.self)", withExtension: "json") else {
            fatalError("Missing file: \(T.self).json")
        }
        let json = try Data(contentsOf: path)
        return json
    }
    
    static func testDecoding<T: Codable>(_ model: T.Type) throws {
        let json = try! TestingTools.loadJSON(for: T.self)
        let _ = try Serializer.decode(T.self, from: json)
    }
    
    static func testEncoding<T: Codable>(_ model: T) throws {
        let expectedData = try! TestingTools.loadJSON(for: T.self)
        let expectedJSON = String(data: expectedData, encoding: .utf8)!
        
        let encodedData = try Serializer.encode(model)
        let encodedJSON = String(data: encodedData, encoding: .utf8)!
        
        if expectedJSON != encodedJSON  {
            throw SerializationError.encodingFailure(message: "Encoded JSON doesn't match sample JSON")
        }
    }
    
}
