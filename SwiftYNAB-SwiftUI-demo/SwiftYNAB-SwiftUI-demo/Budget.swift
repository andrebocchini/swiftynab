//
//  Budget.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

struct Budget: Identifiable {
    let id: String
    let name: String
    let currencyFormat: CurrencyFormat
}

extension Budget {
    init(summary: BudgetSummary) {
        self.id = summary.id
        self.name = summary.name
        self.currencyFormat = summary.currencyFormat
    }
}
