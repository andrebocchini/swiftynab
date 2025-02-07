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

        if let sinceDate {
            let sinceDateString = DateConverter.iso8601DateString(from: sinceDate)
            let queryItem = URLQueryItem(name: "since_date", value: sinceDateString)
            queryItems.append(queryItem)
        }

        if let type {
            let queryItem = URLQueryItem(name: "type", value: type.rawValue)
            queryItems.append(queryItem)
        }

        if let lastKnowledgeOfServer {
            let queryItem = URLQueryItem(
                name: "last_knowledge_of_server",
                value: String(lastKnowledgeOfServer)
            )
            queryItems.append(queryItem)
        }

        return !queryItems.isEmpty ? queryItems : nil
    }
}
