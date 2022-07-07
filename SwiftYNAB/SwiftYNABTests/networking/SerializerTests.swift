//
//  SerializerTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/15/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

final class SerializerTests: XCTestCase {
    func testEncodingConvertsCamelCaseToSnakeCase() throws {
        struct Test: Codable {
            let testVariable: String
        }

        let input = Test(testVariable: "test")
        let result = try Serializer.shared.encode(input)
        let resultJson = String(data: result, encoding: .utf8)
        let expectedJson = "{\n  \"test_variable\" : \"test\"\n}"

        XCTAssertEqual(resultJson, expectedJson)
    }

    func testDecodingConvertsSnakeCasetoCamelCase() throws {
        struct Test: Codable {
            let testVariable: String
        }

        let input = try XCTUnwrap("{\"test_variable\":\"test\"}".data(using: .utf8))
        let result = try Serializer.shared.decode(Test.self, from: input)
        let expected = Test(testVariable: "test")

        XCTAssertEqual(result.testVariable, expected.testVariable)
    }
}
