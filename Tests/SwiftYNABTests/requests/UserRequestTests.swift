//
//  UserRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class UserRequestTests: XCTestCase {
    func testUserRequest() {
        let request = UserRequest()
        XCTAssertEqual(request.path, "/v1/user")
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
