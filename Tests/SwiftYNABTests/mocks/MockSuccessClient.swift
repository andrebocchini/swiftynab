//
//  MockSuccessClient.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

struct MockSuccessClient<T>: ClientType where T: Decodable, T: Sendable {
    let expectedResponse: T

    func perform<R: Request>(_: R) async throws -> R.Response {
        expectedResponse as! R.Response
    }
}
