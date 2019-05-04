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
    
}
