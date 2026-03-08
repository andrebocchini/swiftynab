//
//  RequestMethodTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Request Method")
struct RequestMethodTests {
    @Test("GET method has correct raw value")
    func get() {
        #expect(RequestMethod.get.rawValue == "GET")
    }

    @Test("PATCH method has correct raw value")
    func patch() {
        #expect(RequestMethod.patch.rawValue == "PATCH")
    }

    @Test("POST method has correct raw value")
    func post() {
        #expect(RequestMethod.post.rawValue == "POST")
    }

    @Test("PUT method has correct raw value")
    func put() {
        #expect(RequestMethod.put.rawValue == "PUT")
    }
}
