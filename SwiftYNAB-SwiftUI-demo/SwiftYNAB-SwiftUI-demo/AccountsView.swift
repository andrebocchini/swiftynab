//
//  AccountsView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftUI

struct AccountsView: View {
    @Binding var token: String
    
    @State var viewModel: AccountsViewModelType

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2, anchor: .center)
            } else if viewModel.isError {
                Text("Error loading accounts!")
            } else {
                List(viewModel.accounts, id: \.id) { account in
                    NavigationLink {
                        TransactionsView(
                            token: $token,
                            viewModel: TransactionsViewModel(
                                budget: viewModel.budget,
                                account: account
                            )
                        )
                    } label: {
                        AccountRowView(account: account)
                    }
                }
            }
        }
        .navigationTitle("Accounts")
        .onAppear {
            Task {
                await viewModel.fetchAccounts(using: token)
            }
        }
    }
}
