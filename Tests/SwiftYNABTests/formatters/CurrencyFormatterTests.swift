//
//  CurrencyFormatterTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Currency Formatter") struct CurrencyFormatterTests {
    @Test("Formats currency string with symbol before the amount") func currencyStringSymbolFirst() {
        let format = CurrencyFormat(displaySymbol: true, symbolFirst: true)
        let formatter = CurrencyFormatter(currencyFormat: format)
        #expect("$25.09" == formatter.currencyString(from: 25090))
        #expect("$1.19" == formatter.currencyString(from: 1190))
        #expect("$0.55" == formatter.currencyString(from: 550))
        #expect("$25.90" == formatter.currencyString(from: 25900))
        #expect("$1,000,000.10" == formatter.currencyString(from: 1_000_000_100))
    }

    @Test("Formats currency string with symbol after the amount") func currencyStringSymbolLast() {
        let format = CurrencyFormat(displaySymbol: true, symbolFirst: false)
        let formatter = CurrencyFormatter(currencyFormat: format)
        #expect("25.09$" == formatter.currencyString(from: 25090))
        #expect("1.19$" == formatter.currencyString(from: 1190))
        #expect("0.55$" == formatter.currencyString(from: 550))
        #expect("25.90$" == formatter.currencyString(from: 25900))
        #expect("1,000,000.10$" == formatter.currencyString(from: 1_000_000_100))
    }

    @Test("Formats currency string without a symbol") func currencyStringNoSymbol() {
        let format = CurrencyFormat(displaySymbol: false, symbolFirst: false)
        let formatter = CurrencyFormatter(currencyFormat: format)
        #expect("25.09" == formatter.currencyString(from: 25090))
        #expect("1.19" == formatter.currencyString(from: 1190))
        #expect("0.55" == formatter.currencyString(from: 550))
        #expect("25.90" == formatter.currencyString(from: 25900))
        #expect("1,000,000.10" == formatter.currencyString(from: 1_000_000_100))
    }
}

private extension CurrencyFormat {
    init(displaySymbol: Bool, symbolFirst: Bool) {
        self.init(
            isoCode: "USD",
            exampleFormat: "123,456.78",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: symbolFirst,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: displaySymbol
        )
    }
}
