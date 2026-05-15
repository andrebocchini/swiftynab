//
//  PlanViewModel.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

protocol PlanViewModelType {
    var isLoading: Bool { get }
    var isError: Bool { get }
    var plans: [Plan] { get }

    mutating func fetchPlans(using token: String) async
}

struct PlanViewModel: PlanViewModelType {
    private(set) var isLoading = false
    private(set) var isError = false
    private(set) var plans: [Plan] = []
}

extension PlanViewModel {
    @MainActor mutating func fetchPlans(using token: String) async {
        if !isLoading, !isError {
            defer {
                isLoading = false
            }

            isLoading = true
            let ynab = YNAB(accessToken: token)

            do {
                let result = try await ynab.plans.plans(includeAccounts: true)
                plans = result.map { Plan(summary: $0) }

                isError = false
            } catch {
                isError = true
            }
        }
    }
}
