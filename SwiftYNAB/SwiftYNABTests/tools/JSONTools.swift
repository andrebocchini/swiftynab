//
//  JSONTools.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

class JSONTools {
    static func loadJSON<T>(for _: T.Type) throws -> Data {
        try loadJSON(from: "\(T.self)")
    }

    static func loadJSON(from file: String) throws -> Data {
        guard let path = Bundle(for: self).url(forResource: file, withExtension: "json")
        else {
            fatalError("Missing file: \(file).json")
        }
        let json = try Data(contentsOf: path)
        return json
    }

    static func testDecoding<T: Codable>(type _: T.Type) throws {
        let json = try JSONTools.loadJSON(for: T.self)
        let _ = try Serializer.shared.decode(T.self, from: json)
    }

    static func testDecoding<T: Codable>(jsonFile: String, type _: T.Type) throws {
        let json = try JSONTools.loadJSON(from: jsonFile)
        let _ = try Serializer.shared.decode(T.self, from: json)
    }

    static func testEncoding<T: Codable>(_ model: T) throws {
        let expectedData = try JSONTools.loadJSON(for: T.self)
        let expectedJSON = String(data: expectedData, encoding: .utf8)!

        let encodedData = try Serializer.shared.encode(model)
        let encodedJSON = String(data: encodedData, encoding: .utf8)!

        if expectedJSON != encodedJSON {
            throw SwiftYNABError
                .encodingFailure(message: "Encoded JSON doesn't match sample JSON")
        }
    }
}
