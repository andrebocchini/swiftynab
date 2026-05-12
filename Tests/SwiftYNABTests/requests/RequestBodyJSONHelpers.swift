//
//  RequestBodyJSONHelpers.swift
//  SwiftYNABTests
//
//  Created by OpenAI on 5/12/26.
//

import Foundation
import Testing

func requestBodyJSONObject(from body: Data) throws -> [String: Any] {
    let object = try JSONSerialization.jsonObject(with: body)
    return try #require(object as? [String: Any])
}
