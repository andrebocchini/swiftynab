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
        case autoLoan
        case cash
        case checking
        case creditCard
        case mortgage
        case otherDebt
        case savings
        case unknown

        var display: String {
            switch self {
            case .autoLoan:
                "Auto Loan"
            case .cash:
                "Cash"
            case .checking:
                "Checking"
            case .creditCard:
                "Credit Card"
            case .mortgage:
                "Mortgage"
            case .otherDebt:
                "Other Debt"
            case .savings:
                "Savings"
            case .unknown:
                "Unknown"
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
        id = account.id
        name = account.name

        if let kind = Kind(rawValue: account.type.rawValue) {
            self.kind = kind
        } else {
            kind = .unknown
        }

        if let currencyFormat = budget.currencyFormat {
            let currencyFormatter = CurrencyFormatter(currencyFormat: currencyFormat)
            balance = currencyFormatter.currencyString(from: account.balance) ?? ""
        } else {
            balance = ""
        }

        closed = account.closed
    }
}
