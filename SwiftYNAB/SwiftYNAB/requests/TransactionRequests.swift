//
//  TransactionRequests.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct TransactionRequest {
    
    let budgetId: String
    let transactionId: String
    
}

extension TransactionRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/transactions/\(self.transactionId)"
    }
    
}


struct SaveTransactionRequest {
    
    let budgetId: String
    let transaction: SaveTransaction
    let update: Bool

    init(budgetId: String, transaction: SaveTransaction, update: Bool = false) {
        self.budgetId = budgetId
        self.transaction = transaction
        self.update = update
    }
    
}

extension SaveTransactionRequest: Request {
    
    var path: String {
        if self.update,
            let id = self.transaction.id {
            return "/v1/budgets/\(self.budgetId)/transactions/\(id)"
        } else {
            return "/v1/budgets/\(self.budgetId)/transactions"
        }
    }
    
    var method: String {
        return self.update ? "PUT" : "POST"
    }
    
    var body: Data? {
        let wrapper = SaveTransactionRequestWrapper(with: self.transaction)
        return try? Serializer.encode(wrapper)
    }
    
}


struct SaveTransactionRequestWrapper: Codable {
    
    var transaction: SaveTransaction
    
    init(with transaction: SaveTransaction) {
        self.transaction = transaction
    }
    
}


struct SaveTransactionsRequest {
    
    let budgetId: String
    let transactions: [SaveTransaction]
    let update: Bool
    
    init(budgetId: String, transactions: [SaveTransaction], update: Bool = false) {
        self.budgetId = budgetId
        self.transactions = transactions
        self.update = update
    }
    
}

extension SaveTransactionsRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/transactions"
    }
    
    var method: String {
        return self.update ? "PATCH" : "POST"
    }
    
    var body: Data? {
        let wrapper = SaveTransactionsRequestWrapper(with: self.transactions)
        return try? Serializer.encode(wrapper)
    }
    
}


struct SaveTransactionsRequestWrapper: Codable {
    
    var transactions: [SaveTransaction]
    
    init(with transactions: [SaveTransaction]) {
        self.transactions = transactions
    }
    
}


struct TransactionsByAccountRequest {
    
    let budgetId: String
    let accountId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String,
         accountId: String,
         sinceDate: Date? = nil,
         type: TransactionType? = nil,
         lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.accountId = accountId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension TransactionsByAccountRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(budgetId)/accounts/\(accountId)/transactions"
    }
    
    var query: [URLQueryItem]? {
        return TransactionQueryBuilder.buildQuery(sinceDate: self.sinceDate,
                                             type: self.type,
                                             lastKnowledgeOfServer: self.lastKnowledgeOfServer)
    }
    
}


struct TransactionsByBudgetRequest {
    
    let budgetId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String,
         sinceDate: Date? = nil,
         type: TransactionType? = nil,
         lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension TransactionsByBudgetRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(budgetId)/transactions"
    }
    
    var query: [URLQueryItem]? {
        return TransactionQueryBuilder.buildQuery(sinceDate: self.sinceDate,
                                             type: self.type,
                                             lastKnowledgeOfServer: self.lastKnowledgeOfServer)
    }
    
}


struct TransactionsByCategoryRequest {
    
    let budgetId: String
    let categoryId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String,
         categoryId: String,
         sinceDate: Date? = nil,
         type: TransactionType? = nil,
         lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.categoryId = categoryId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension TransactionsByCategoryRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/categories/\(self.categoryId)/transactions"
    }
    
    var query: [URLQueryItem]? {
        return TransactionQueryBuilder.buildQuery(sinceDate: self.sinceDate,
                                             type: self.type,
                                             lastKnowledgeOfServer: self.lastKnowledgeOfServer)
    }
    
}


struct TransactionsByPayeeRequest {
    
    let budgetId: String
    let payeeId: String
    let sinceDate: Date?
    let type: TransactionType?
    let lastKnowledgeOfServer: Int?
    
    init(budgetId: String,
         payeeId: String,
         sinceDate: Date? = nil,
         type: TransactionType? = nil,
         lastKnowledgeOfServer: Int? = nil) {
        self.budgetId = budgetId
        self.payeeId = payeeId
        self.sinceDate = sinceDate
        self.type = type
        self.lastKnowledgeOfServer = lastKnowledgeOfServer
    }
    
}

extension TransactionsByPayeeRequest: Request {
    
    var path: String {
        return "/v1/budgets/\(self.budgetId)/payees/\(self.payeeId)/transactions"
    }
    
    var query: [URLQueryItem]? {
        return TransactionQueryBuilder.buildQuery(sinceDate: self.sinceDate,
                                             type: self.type,
                                             lastKnowledgeOfServer: self.lastKnowledgeOfServer)
    }
    
}


fileprivate struct TransactionQueryBuilder {
    
    static func buildQuery(sinceDate: Date?, type: TransactionType?, lastKnowledgeOfServer: Int?) -> [URLQueryItem]? {
    
        var queryItems = [URLQueryItem]()
        
        if let sinceDate = sinceDate {
            let sinceDateString = DateConverter.iso8601DateString(from: sinceDate)
            queryItems.append(URLQueryItem(name: "since_date", value: sinceDateString))
        }
        
        if let type = type {
            queryItems.append(URLQueryItem(name: "type", value: type.rawValue))
        }
        
        if let lastKnowledgeOfServer = lastKnowledgeOfServer {
            queryItems.append(URLQueryItem(name: "last_knowledge_of_server",
                                           value: String(lastKnowledgeOfServer)))
        }
        
        return queryItems.count > 0 ? queryItems : nil
    }
    
}
