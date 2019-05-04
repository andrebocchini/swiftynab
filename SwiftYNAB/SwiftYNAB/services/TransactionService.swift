//
//  TransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to transaction operations
public class TransactionService: Service {
   
    /**
     Returns a single transaction.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
     - transactionId: Id of the transaction.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getTransaction(budgetId: String,
                               transactionId: String,
                               completion: @escaping (TransactionDetail?, ErrorDetail?) -> Void) {
        let request = TransactionRequest(budgetId: budgetId, transactionId: transactionId)
        self.client.request(request) {
            (response: TransactionResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transaction, error)
        }
    }
    
    /**
     Returns all transactions for a budget.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - sinceDate: If specified, only transactions on or after this date will be included.
     The date should be ISO formatted (e.g. 2016-12-30).
     - type: If specified, only transactions of the specified type will be included.
     - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
     have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the list of transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getTransactions(budgetId: String,
                                sinceDate: Date? = nil,
                                type: TransactionType? = nil,
                                lastKnowledgeOfServer: Int? = nil,
                                completion: @escaping ([TransactionDetail]?, ErrorDetail?) -> Void) {
        let request = TransactionsByBudgetRequest(budgetId: budgetId,
                                                  sinceDate: sinceDate,
                                                  type: type,
                                                  lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: TransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions, error)
        }
    }

    /**
     Returns all transactions for an account.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - accountId: The id of the account.
     - sinceDate: If specified, only transactions on or after this date will be included.
     The date should be ISO formatted (e.g. 2016-12-30).
     - type: If specified, only transactions of the specified type will be included.
     - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
     have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the list of transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getTransactions(budgetId: String,
                                accountId: String,
                                sinceDate: Date? = nil,
                                type: TransactionType? = nil,
                                lastKnowledgeOfServer: Int? = nil,
                                completion: @escaping ([TransactionDetail]?, ErrorDetail?) -> Void) {
        let request = TransactionsByAccountRequest(budgetId: budgetId,
                                                   accountId: accountId,
                                                   sinceDate: sinceDate,
                                                   type: type,
                                                   lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: TransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions, error)
        }
    }
    
    /**
     Returns all transactions for a category.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - categoryId: The id of the category.
     - sinceDate: If specified, only transactions on or after this date will be included.
     The date should be ISO formatted (e.g. 2016-12-30).
     - type: If specified, only transactions of the specified type will be included.
     - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
     have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the list of transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getTransactions(budgetId: String,
                                categoryId: String,
                                sinceDate: Date? = nil,
                                type: TransactionType? = nil,
                                lastKnowledgeOfServer: Int? = nil,
                                completion: @escaping ([HybridTransaction]?, ErrorDetail?) -> Void) {
        let request = TransactionsByCategoryRequest(budgetId: budgetId,
                                                    categoryId: categoryId,
                                                    sinceDate: sinceDate,
                                                    type: type,
                                                    lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: HybridTransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions, error)
        }
    }

    /**
     Returns all transactions for a payee.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - payeeId: The id of the payee.
     - sinceDate: If specified, only transactions on or after this date will be included.
     The date should be ISO formatted (e.g. 2016-12-30).
     - type: If specified, only transactions of the specified type will be included.
     - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
     have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the list of transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getTransactions(budgetId: String,
                                payeeId: String,
                                sinceDate: Date? = nil,
                                type: TransactionType? = nil,
                                lastKnowledgeOfServer: Int? = nil,
                                completion: @escaping ([HybridTransaction]?, ErrorDetail?) -> Void) {
        let request = TransactionsByPayeeRequest(budgetId: budgetId,
                                                 payeeId: payeeId,
                                                 sinceDate: sinceDate,
                                                 type: type,
                                                 lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: HybridTransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions, error)
        }
    }
    
    /**
     Creates a new transactions.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - transaction: New transaction
     - completion: Completion handler which takes in three parameters. The first parameter takes in
     the new transaction, the second takes in the new transaction id, and the third takes in any
     errors that may occur during creation.
     */
    public func saveTransaction(budgetId: String,
                                transaction: NewTransaction,
                                completion: @escaping (TransactionDetail?, [String]?, ErrorDetail?) -> Void) {
        let request = SaveTransactionRequest(budgetId: budgetId, transaction: transaction)
        self.client.request(request) {
            (response: SaveTransactionResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transaction, response?.data.transactionIds, error)
        }
    }
    
    /**
     Creates several new transactions.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - transactions: New transactions
     - completion: Completion handler which takes in four parameters. The first parameter takes in
     the list of new transactions, the second takes in the new transaction ids, the third takes in
     a list of duplicate import ids, and the fourth takes in any errors that may occur during creation.
     */
    public func saveTransactions(budgetId: String,
                                 transactions: [NewTransaction],
                                 completion: @escaping ([TransactionDetail]?, [String]?, [String]?, ErrorDetail?) -> Void) {
        let request = SaveTransactionsRequest(budgetId: budgetId, transactions: transactions)
        self.client.request(request) {
            (response: SaveTransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions,
                       response?.data.transactionIds,
                       response?.data.duplicateImportIds,
                       error)
        }
    }

    /**
     Updates a single transactions.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - transaction: Transaction to be updated
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the updated transaction, and the second takes in any errors that may occur during creation.
     */
    public func updateTransaction(budgetId: String,
                                  transaction: UpdateTransaction,
                                  completion: @escaping (TransactionDetail?, ErrorDetail?) -> Void) {
        let request = SaveTransactionRequest(budgetId: budgetId, transaction: transaction, update: true)
        self.client.request(request) {
            (response: SaveTransactionResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transaction, error)
        }
    }
    
    /**
     Updates several transactions.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - transactions: Updated transactions
     - completion: Completion handler which takes in four parameters. The first parameter takes in
     the list of updated transactions, the second takes in the updated transaction ids, the third takes in
     a list of duplicate import ids, and the fourth takes in any errors that may occur during creation.
     */
    public func updateTransactions(budgetId: String,
                                   transactions: [UpdateTransaction],
                                   completion: @escaping ([TransactionDetail]?, [String]?, [String]?, ErrorDetail?) -> Void) {
        let request = SaveTransactionsRequest(budgetId: budgetId, transactions: transactions, update: true)
        self.client.request(request) {
            (response: SaveTransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.transactions,
                       response?.data.transactionIds,
                       response?.data.duplicateImportIds,
                       error)
        }
    }
    
}
