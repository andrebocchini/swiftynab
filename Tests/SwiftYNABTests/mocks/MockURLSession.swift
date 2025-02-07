//
//  MockURLSession.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
@testable import SwiftYNAB

struct MockURLSession: URLSessionType {
    let data: Data
    let response: URLResponse

    func data(
        for _: URLRequest,
        delegate _: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        (data, response)
    }
}
