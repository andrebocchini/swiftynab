//
//  CurrencyFormatterTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CurrencyFormatterTests: XCTestCase {
    func testCurrencyStringSymbolFirst() {
        let format = CurrencyFormat(displaySymbol: true, symbolFirst: true)
        let formatter = CurrencyFormatter(currencyFormat: format)
        XCTAssertEqual("$25.09", formatter.currencyString(from: 25090))
        XCTAssertEqual("$1.19", formatter.currencyString(from: 1190))
        XCTAssertEqual("$0.55", formatter.currencyString(from: 550))
        XCTAssertEqual("$25.90", formatter.currencyString(from: 25900))
        XCTAssertEqual("$1,000,000.10", formatter.currencyString(from: 1_000_000_100))
    }

    func testCurrencyStringSymbolLast() {
        let format = CurrencyFormat(displaySymbol: true, symbolFirst: false)
        let formatter = CurrencyFormatter(currencyFormat: format)
        XCTAssertEqual("25.09$", formatter.currencyString(from: 25090))
        XCTAssertEqual("1.19$", formatter.currencyString(from: 1190))
        XCTAssertEqual("0.55$", formatter.currencyString(from: 550))
        XCTAssertEqual("25.90$", formatter.currencyString(from: 25900))
        XCTAssertEqual("1,000,000.10$", formatter.currencyString(from: 1_000_000_100))
    }

    func testCurrencyStringNoSymbol() {
        let format = CurrencyFormat(displaySymbol: false, symbolFirst: false)
        let formatter = CurrencyFormatter(currencyFormat: format)
        XCTAssertEqual("25.09", formatter.currencyString(from: 25090))
        XCTAssertEqual("1.19", formatter.currencyString(from: 1190))
        XCTAssertEqual("0.55", formatter.currencyString(from: 550))
        XCTAssertEqual("25.90", formatter.currencyString(from: 25900))
        XCTAssertEqual("1,000,000.10", formatter.currencyString(from: 1_000_000_100))
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
