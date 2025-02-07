//
//  TransactionsViewModel.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

protocol TransactionsViewModelType {
    var isLoading: Bool { get }
    var isError: Bool { get }
    var transactions: [Transaction] { get }
    var budget: Budget { get }
    var account: Account { get }

    mutating func fetchTransactions(using token: String) async
}

struct TransactionsViewModel: TransactionsViewModelType {
    private(set) var isLoading = false
    private(set) var isError = false
    private(set) var transactions: [Transaction] = []
    private(set) var budget: Budget
    private(set) var account: Account

    init(budget: Budget, account: Account) {
        self.budget = budget
        self.account = account
    }
}

extension TransactionsViewModel {
    @MainActor mutating func fetchTransactions(using token: String) async {
        if !isLoading, !isError {
            defer {
                isLoading = false
            }

            isLoading = true
            let ynab = YNAB(accessToken: token)

            do {
                let (result, _) = try await ynab.transactions.transactions(
                    budgetId: budget.id,
                    accountId: account.id,
                    lastKnowledgeOfServer: nil
                )

                guard let currencyFormat = budget.currencyFormat else {
                    isError = true
                    return
                }

                transactions = result
                    .map { Transaction(transaction: $0, currencyFormat: currencyFormat) }
                    .reversed()

                isError = false
            } catch {
                isError = true
            }
        }
    }
}
