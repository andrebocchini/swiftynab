//
//  TransactionRowView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 8) {
            VStack(spacing: 8) {
                Text(transaction.payee)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(transaction.date)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)

            Text(transaction.amount)
                .font(.subheadline)
        }
    }
}
