//
//  SwiftYNABError.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Errors that occur while building requests or handling responses
public enum SwiftYNABError: Error, Sendable {
    /// Failure decoding JSON
    case decodingFailure(message: String)
    /// Failure encoding JSON
    case encodingFailure(message: String)
    /// HTTP error
    case httpError(statusCode: Int)
    /// YNAB API Error
    case apiError(detail: ErrorDetail)
    /// A valid URL could not be constructed for the request
    case invalidRequest(path: String)
    /// Unknown error
    case unknown
}

extension SwiftYNABError: Equatable {
    public static func == (lhs: SwiftYNABError, rhs: SwiftYNABError) -> Bool {
        switch (lhs, rhs) {
        case (.decodingFailure, .decodingFailure):
            true
        case (.encodingFailure, .encodingFailure):
            true
        case let (.httpError(lhsStatusCode), .httpError(rhsStatusCode)):
            lhsStatusCode == rhsStatusCode
        case let (.apiError(lhsErrorDetail), .apiError(rhsErrorDetail)):
            lhsErrorDetail == rhsErrorDetail
        case let (.invalidRequest(lhsPath), .invalidRequest(rhsPath)):
            lhsPath == rhsPath
        case (.unknown, .unknown):
            true
        default:
            false
        }
    }
}
