//
//  Account.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

struct Account {
    enum Kind: String {
        case autoLoan = "autoLoan"
        case cash = "cash"
        case checking = "checking"
        case creditCard = "creditCard"
        case mortgage = "mortgage"
        case otherDebt = "otherDebt"
        case savings = "savings"
        case unknown

        var display: String {
            switch self {
            case .autoLoan:
                return "Auto Loan"
            case .cash:
                return "Cash"
            case .checking:
                return "Checking"
            case .creditCard:
                return "Credit Card"
            case .mortgage:
                return "Mortgage"
            case .otherDebt:
                return "Other Debt"
            case .savings:
                return "Savings"
            case .unknown:
                return "Unknown"
            }
        }
    }

    let id: String
    let name: String
    let kind: Kind
    let balance: String
    let closed: Bool
    
}

extension Account {
    init(account: SwiftYNAB.Account, budget: Budget) {
        self.id = account.id
        self.name = account.name

        if let kind = Kind(rawValue: account.type) {
            self.kind = kind
        } else {
            self.kind = .unknown
        }

        let currencyFormatter = CurrencyFormatter(currencyFormat: budget.currencyFormat)
        self.balance = currencyFormatter.currencyString(from: account.balance) ?? ""

        self.closed = account.closed
    }
}
