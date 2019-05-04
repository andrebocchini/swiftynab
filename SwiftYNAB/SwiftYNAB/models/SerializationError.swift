//
//  SerializationError.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Errors that occur during encoding or decoding of JSON requests and responses
enum SerializationError: Error {
    
    /// Failure decoding JSON
    case decodingFailure(message: String)
    
    /// Failure encoding JSON
    case encodingFailure(message: String)
    
}
