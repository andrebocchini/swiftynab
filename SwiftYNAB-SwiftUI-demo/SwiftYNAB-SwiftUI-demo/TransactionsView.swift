//
//  TransactionsView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftUI

struct TransactionsView: View {
    @Binding var token: String

    @State var viewModel: TransactionsViewModelType

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2, anchor: .center)
            } else if viewModel.isError {
                Text("Error loading transactions!")
            } else {
                List(viewModel.transactions, id: \.id) { transaction in
                    TransactionRowView(transaction: transaction)
                }
            }
        }
        .navigationTitle("Transactions")
        .onAppear {
            Task {
                await viewModel.fetchTransactions(using: token)
            }
        }
    }
}
