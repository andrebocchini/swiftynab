//
//  TransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class SaveTransactionRequestTests: XCTestCase {
    
    func testSaveTransactionRequest() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let wrapper = SaveTransactionRequestWrapper(with: transaction)
        let body = try! Serializer.encode(wrapper)
        let request = SaveTransactionRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                             transaction: transaction)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "POST")
        XCTAssertEqual(request.body, body)
        XCTAssertNil(request.query)
    }
    
    func testSaveTransactionRequestWrapper() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let saveTransactionRequestWrapper = SaveTransactionRequestWrapper(with: transaction)
        XCTAssertNoThrow(try TestingTools.testEncoding(saveTransactionRequestWrapper))
    }
    
    func testSaveTransactions() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let wrapper = SaveTransactionsRequestWrapper(with: [transaction])
        let body = try! Serializer.encode(wrapper)
        let request = SaveTransactionsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                              transactions: [transaction])
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "POST")
        XCTAssertEqual(request.body, body)
        XCTAssertNil(request.query)
    }
    
    func testSaveTransactionsRequestWrapper() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Florida")
        let saveTransactionsRequestWrapper = SaveTransactionsRequestWrapper(with: [transaction])
        XCTAssertNoThrow(try TestingTools.testEncoding(saveTransactionsRequestWrapper))
    }
    
    func testUpdateTransactions() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let wrapper = SaveTransactionsRequestWrapper(with: [transaction])
        let body = try! Serializer.encode(wrapper)
        let request = SaveTransactionsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                              transactions: [transaction],
                                              update: true)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "PATCH")
        XCTAssertEqual(request.body, body)
        XCTAssertNil(request.query)
    }
    
    func testAccountTransactionsNoQuery() {
        let request = TransactionsByAccountRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                   accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testAccountTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1556717342.216656)
        let request = TransactionsByAccountRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                   accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                   sinceDate: date,
                                                   type: .uncategorized,
                                                   lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 3)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "since_date", value: "2019-05-01"))
        XCTAssertEqual(request.query?[1], URLQueryItem(name: "type", value: "uncategorized"))
        XCTAssertEqual(request.query?[2], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testBudgetTransactionsNoQuery() {
        let request = TransactionsByBudgetRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testBudgetTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1556717342.216656)
        let request = TransactionsByBudgetRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                  sinceDate: date,
                                                  type: .uncategorized,
                                                  lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 3)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "since_date", value: "2019-05-01"))
        XCTAssertEqual(request.query?[1], URLQueryItem(name: "type", value: "uncategorized"))
        XCTAssertEqual(request.query?[2], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testTransactionRequest() {
        let request = TransactionRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                         transactionId: "c36fbd68-131e-4ea8-b30f-94f43423021c")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/c36fbd68-131e-4ea8-b30f-94f43423021c")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testUpdateTransactionRequest() {
        let transaction = SaveTransaction(id: "c36fbd68-131e-4ea8-b30f-94f43423021c",
                                          date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let wrapper = SaveTransactionRequestWrapper(with: transaction)
        let body = try! Serializer.encode(wrapper)
        let request = SaveTransactionRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                             transaction: transaction,
                                             update: true)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/c36fbd68-131e-4ea8-b30f-94f43423021c")
        XCTAssertEqual(request.method, "PUT")
        XCTAssertEqual(request.body, body)
        XCTAssertNil(request.query)
    }
    
    func testUpdateTransactionRequestMissingId() {
        let transaction = SaveTransaction(date: "2019-04-30",
                                          amount: -25000,
                                          accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
                                          payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
                                          payeeName: "University of Illinois at Chicago")
        let wrapper = SaveTransactionRequestWrapper(with: transaction)
        let body = try! Serializer.encode(wrapper)
        let request = SaveTransactionRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                             transaction: transaction,
                                             update: true)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        XCTAssertEqual(request.method, "PUT")
        XCTAssertEqual(request.body, body)
        XCTAssertNil(request.query)
    }
    
    func testCategoryTransactionsNoQuery() {
        let request = TransactionsByCategoryRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                    categoryId: "cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testCategoryTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1556717342.216656)
        let request = TransactionsByCategoryRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                   categoryId: "cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc",
                                                   sinceDate: date,
                                                   type: .uncategorized,
                                                   lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 3)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "since_date", value: "2019-05-01"))
        XCTAssertEqual(request.query?[1], URLQueryItem(name: "type", value: "uncategorized"))
        XCTAssertEqual(request.query?[2], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testPayeeTransactionsNoQuery() {
        let request = TransactionsByPayeeRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                    payeeId: "63509599-7805-4f30-24bf-0ae2c2f967f0")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees/63509599-7805-4f30-24bf-0ae2c2f967f0/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testPayeeTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1556717342.216656)
        let request = TransactionsByPayeeRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                    payeeId: "63509599-7805-4f30-24bf-0ae2c2f967f0",
                                                    sinceDate: date,
                                                    type: .uncategorized,
                                                    lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees/63509599-7805-4f30-24bf-0ae2c2f967f0/transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 3)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "since_date", value: "2019-05-01"))
        XCTAssertEqual(request.query?[1], URLQueryItem(name: "type", value: "uncategorized"))
        XCTAssertEqual(request.query?[2], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    
}
