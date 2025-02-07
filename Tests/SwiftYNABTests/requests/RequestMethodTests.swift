//
//  RequestMethodTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class RequestMethodTests: XCTestCase {
    func testGet() {
        XCTAssertEqual(RequestMethod.get.rawValue, "GET")
    }

    func testPatch() {
        XCTAssertEqual(RequestMethod.patch.rawValue, "PATCH")
    }

    func testPost() {
        XCTAssertEqual(RequestMethod.post.rawValue, "POST")
    }

    func testPut() {
        XCTAssertEqual(RequestMethod.put.rawValue, "PUT")
    }
}
