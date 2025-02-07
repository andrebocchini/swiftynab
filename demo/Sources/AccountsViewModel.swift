//
//  AccountsViewModel.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

protocol AccountsViewModelType {
    var isLoading: Bool { get }
    var isError: Bool { get }
    var accounts: [Account] { get }
    var budget: Budget { get }

    mutating func fetchAccounts(using token: String) async
}

struct AccountsViewModel: AccountsViewModelType {
    private(set) var isLoading = false
    private(set) var isError = false
    private(set) var accounts: [Account] = []
    private(set) var budget: Budget
}

extension AccountsViewModel {
    @MainActor mutating func fetchAccounts(using token: String) async {
        if !isLoading, !isError {
            defer {
                isLoading = false
            }

            isLoading = true
            let ynab = YNAB(accessToken: token)

            do {
                let result = try await ynab.accounts.accounts(budgetId: budget.id)
                accounts = result.accounts
                    .filter { !$0.closed }
                    .map { Account(account: $0, budget: budget) }

                isError = false
            } catch {
                isError = true
            }
        }
    }
}
