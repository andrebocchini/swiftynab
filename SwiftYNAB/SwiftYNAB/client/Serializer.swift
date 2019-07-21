//
//  Serializer.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

class Serializer {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    static func decode<T: Codable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try self.decoder.decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            switch(decodingError) {
            case .keyNotFound(_, let context),
                 .dataCorrupted(let context),
                 .typeMismatch(_, let context),
                 .valueNotFound(_, let context):
                throw SerializationError.decodingFailure(message: "\(context)")
            default:
                throw SerializationError.decodingFailure(message: "Unknown decoding error occurred")
            }
        }
    }

    static func encode<T: Codable>(_ model: T) throws -> Data {
        do {
            return try self.encoder.encode(model)
        } catch let encodingError as EncodingError {
            switch(encodingError) {
            case .invalidValue(_, let context):
                throw SerializationError.encodingFailure(message: context.debugDescription)
            default:
                throw SerializationError.encodingFailure(message: "Unknown encoding error occurred")
            }
        }
    }
    
}
