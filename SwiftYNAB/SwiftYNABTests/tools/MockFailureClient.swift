//
//  MockFailureClient.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

class MockFailureClient: ClientType {
    let expectedError: SwiftYNABError

    init(expectedError: SwiftYNABError) {
        self.expectedError = expectedError
    }

    func request<T>(_: Request) async throws -> T where T: Decodable, T: Encodable {
        throw expectedError
    }
}
