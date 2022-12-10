//
//  BudgetsView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/8/22.
//

import Foundation
import SwiftUI

struct BudgetsView: View {
    @Binding var token: String

    @State var viewModel: BudgetViewModelType = BudgetViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2, anchor: .center)
            } else if viewModel.isError {
                Text("Error loading budgets!")
            } else {
                List(viewModel.budgets, id: \.id) { budget in
                    NavigationLink {
                        AccountsView(token: $token, viewModel: AccountsViewModel(budget: budget))
                    } label: {
                        Text(budget.name)
                    }
                }
            }
        }
        .navigationTitle("Budgets")
        .onAppear {
            Task {
                await viewModel.fetchBudgets(using: token)
            }
        }
    }
}
