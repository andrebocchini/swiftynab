//
//  SerializerTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/15/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Serializer") struct SerializerTests {
    @Test("Encoding converts camelCase property names to snake_case JSON keys") func encodingConvertsCamelCaseToSnakeCase() throws {
        struct Test: Codable {
            let testVariable: String
        }

        let input = Test(testVariable: "test")
        let serializer = Serializer()
        let result = try serializer.encode(input)
        let resultJson = String(data: result, encoding: .utf8)
        let expectedJson = "{\n  \"test_variable\" : \"test\"\n}"

        #expect(resultJson == expectedJson)
    }

    @Test("Decoding converts snake_case JSON keys to camelCase property names") func decodingConvertsSnakeCasetoCamelCase() throws {
        struct Test: Codable {
            let testVariable: String
        }

        // swiftlint:disable:next non_optional_string_data_conversion
        let input = try #require("{\"test_variable\":\"test\"}".data(using: .utf8))
        let serializer = Serializer()
        let result = try serializer.decode(Test.self, from: input)
        let expected = Test(testVariable: "test")

        #expect(result.testVariable == expected.testVariable)
    }
}
