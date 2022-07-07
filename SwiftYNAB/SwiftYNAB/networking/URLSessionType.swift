//
//  URLSessionType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol URLSessionType {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws
        -> (Data, URLResponse)
}
