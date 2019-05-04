//
//  ScheduledTransactionService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to scheduled transaction operations
public class ScheduledTransactionService: Service {
    
    /**
     Returns a single scheduled transaction.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
     - transactionId: Id of the transaction.
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getScheduledTransaction(budgetId: String,
                                        transactionId: String,
                                        completion: @escaping (ScheduledTransactionDetail?, ErrorDetail?) -> Void) {
        let request = ScheduledTransactionRequest(budgetId: budgetId, transactionId: transactionId)
        self.client.request(request) {
            (response: ScheduledTransactionResponse?, error: ErrorDetail?) in
            
            completion(response?.data.scheduledTransaction, error)
        }
    }
    
    /**
     Returns all scheduled transactions.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget).
     - completion: Completion handler which takes in two parameters. The first parameter takes in
     the transactions, and the second one takes in any errors that may occur during retrieval.
     */
    public func getScheduledTransactions(budgetId: String,
                                         completion: @escaping ([ScheduledTransactionDetail]?, ErrorDetail?) -> Void) {
        let request = ScheduledTransactionsRequest(budgetId: budgetId)
        self.client.request(request) {
            (response: ScheduledTransactionsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.scheduledTransactions, error)
        }
    }
    
}
