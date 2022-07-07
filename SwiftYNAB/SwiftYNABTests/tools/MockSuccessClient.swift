//
//  MockSuccessClient.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

class MockSuccessClient<R: Codable>: ClientType {
    let expectedResponse: R

    init(expectedResponse: R) {
        self.expectedResponse = expectedResponse
    }

    func request<T>(_: Request) async throws -> T where T: Decodable, T: Encodable {
        expectedResponse as! T
    }
}
