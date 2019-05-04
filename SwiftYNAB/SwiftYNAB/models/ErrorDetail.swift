//
//  ErrorDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Model for API errors and client Framework errors
public struct ErrorDetail: Codable, Equatable {
    
    /// Error id
    public let id: String
    
    /// Short name for the error
    public let name: String
    
    /// Detailed message explaining the error
    public let detail: String
    
    init(id: String, name: String, detail: String) {
        self.id = id
        self.name = name
        self.detail = detail
    }
    
    /// Implementation of Equatable, compares two `ErrorDetail` objects
    public static func ==(lhs: ErrorDetail, rhs: ErrorDetail) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.detail == rhs.detail
    }
    
}

extension ErrorDetail {
    
    static let defaultErrorDetail = ErrorDetail(id: "000",
                                                name: "Unknown",
                                                detail: "Unknown error occurred")
    
    static func errorDetail(from serializationError: SerializationError) -> ErrorDetail {
        switch(serializationError) {
        case .decodingFailure(let message):
            return ErrorDetail(id: "000", name: "Decoding Error", detail: message)
        case .encodingFailure(let message):
            return ErrorDetail(id: "000", name: "Encoding Error", detail: message)
        }
    }
    
}
