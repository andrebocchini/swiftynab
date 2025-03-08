//
//  TransactionQueryBuilder.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

enum TransactionQueryBuilder {
    static func buildQuery(
        sinceDate: Date?,
        type: TransactionType?,
        lastKnowledgeOfServer: ServerKnowledge?
    ) -> [URLQueryItem]? {
        var queryItems = [URLQueryItem]()

        if let sinceDate = sinceDate {
            let sinceDateString = DateConverter.iso8601DateString(from: sinceDate)
            queryItems.append(URLQueryItem(name: "since_date", value: sinceDateString))
        }

        if let type = type {
            queryItems.append(URLQueryItem(name: "type", value: type.rawValue))
        }

        if let lastKnowledgeOfServer = lastKnowledgeOfServer {
            queryItems.append(URLQueryItem(
                name: "last_knowledge_of_server",
                value: String(lastKnowledgeOfServer)
            ))
        }

        return !queryItems.isEmpty ? queryItems : nil
    }
}
