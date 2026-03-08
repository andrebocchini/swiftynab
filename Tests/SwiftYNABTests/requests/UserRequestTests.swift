//
//  UserRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("User Request")
struct UserRequestTests {
    @Test("Request targets user endpoint with GET method")
    func userRequest() {
        let request = UserRequest()
        #expect(request.path == "/v1/user")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
