//
//  Transactions.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

struct Transaction {
    let id: String
    let amount: String
    let date: String
    let payee: String
}

extension Transaction {
    init(transaction: TransactionDetail, currencyFormat: CurrencyFormat) {
        self.id = transaction.id

        let currencyFormatter = CurrencyFormatter(currencyFormat: currencyFormat)
        self.amount = currencyFormatter.currencyString(from: transaction.amount) ?? ""

        self.date = transaction.date
        self.payee = transaction.payeeName ?? ""
    }
}
