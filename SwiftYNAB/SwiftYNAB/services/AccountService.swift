//
//  AccountService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to account operations
public class AccountService: Service {

    /**
     Retrieves a single account
     
     - Parameters:
     - budgetId: Id of the budget the account belongs to
     - accountId: Id of the account to be retrieved
     - completion: Completion handler that accepts account and error data as parameters.
     If the are problems retrieving the account, the account data will be `nil` and the
     error will contain error information.
     */
    public func getAccount(budgetId: String,
                           accountId: String,
                           completion: @escaping (Account?, ErrorDetail?) -> Void) {
        let request = AccountRequest(budgetId: budgetId, accountId: accountId)
        self.client.request(request) {
            (response: AccountResponse?, error: ErrorDetail?) in
            
            completion(response?.data.account, error)
        }
    }

    /**
     Retrieves all accounts for a single budget
     
     - Parameters:
     - budgetId: Id of the budget the accounts belongs to
     - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer` will be included.
     - completion: Completion handler that accepts accounts and error data as parameters.
     */
    public func getAccounts(budgetId: String,
                            lastKnowledgeOfServer: Int? = nil,
                            completion: @escaping ([Account]?, ErrorDetail?) -> Void) {
        let request = AccountsRequest(budgetId: budgetId, lastKnowledgeOfServer: lastKnowledgeOfServer)
        self.client.request(request) {
            (response: AccountsResponse?, error: ErrorDetail?) in
            
            completion(response?.data.accounts, error)
        }
    }
    
    /**
     Creates a new unlinked account in a budget.
     
     - Parameters:
     - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
     - name: The name of the new account
     - type: The type of the new account
     - completion: Completion handler that takes in two parameters.  First parameter contains the
     new account, and the second parameter contains any errors encountered during creation.
     */
    public func newBudgetAccount(budgetId: String,
                                 name: String,
                                 type: String,
                                 balance: Int,
                                 completion: @escaping (Account?, ErrorDetail?) -> Void) {
        let request = NewBudgetAccountRequest(budgetId: budgetId, name: name, type: type, balance: balance)
        self.client.request(request) {
            (response: NewBudgetAccountResponse?, error: ErrorDetail?) in
            
            completion(response?.data.account, error)
        }
    }
    
}
