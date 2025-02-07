//
//  MockFailureClient.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

struct MockFailureClient: ClientType {
    let expectedError: SwiftYNABError

    func perform<R>(_: R) async throws -> R.Response where R: SwiftYNAB.Request {
        throw expectedError
    }
}
