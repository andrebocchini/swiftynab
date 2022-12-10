//
//  BudgetViewModel.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

protocol BudgetViewModelType {
    var isLoading: Bool { get }
    var isError: Bool { get }
    var budgets: [Budget] { get }

    mutating func fetchBudgets(using token: String) async
}

struct BudgetViewModel: BudgetViewModelType {
    private(set) var isLoading = false
    private(set) var isError = false
    private(set) var budgets: [Budget] = []
}

extension BudgetViewModel {
    @MainActor mutating func fetchBudgets(using token: String) async {
        if !isLoading, !isError {
            defer {
                isLoading = false
            }

            isLoading = true
            let ynab = YNAB(accessToken: token)

            do {
                let result = try await ynab.budgets.getBudgets()
                budgets = result.map({ Budget(summary: $0) })
                
                isError = false
            } catch {
                isError = true
            }
        }
    }
}
