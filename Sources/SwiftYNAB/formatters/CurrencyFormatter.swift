//
//  CurrencyFormatter.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Converts currency data from API responses into displayeable strings
public struct CurrencyFormatter: Sendable {
    private let currencyFormat: CurrencyFormat

    /// Initializes the formatter using format information from a budget
    ///
    /// - Parameters:
    ///    - currencyFormat: Currency format obtained from a budget
    public init(currencyFormat: CurrencyFormat) {
        self.currencyFormat = currencyFormat
    }

    ///  Converts milliunit amounts into a budget format currency string
    ///
    ///  - Parameters:
    ///     - from: Amount in milliunits
    ///
    ///  - Returns: Budget format currency string if conversion is successful, nil otherwise
    public func currencyString(from amount: Int) -> String? {
        let amountAsNumber = NSNumber(floatLiteral: Double(amount) / 1000)

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.generatesDecimalNumbers = true
        formatter.currencySymbol = currencyFormat.currencySymbol
        formatter.groupingSeparator = currencyFormat.groupSeparator
        formatter.usesGroupingSeparator = true
        formatter.decimalSeparator = currencyFormat.decimalSeparator
        formatter.alwaysShowsDecimalSeparator = true
        formatter.minimumFractionDigits = currencyFormat.decimalDigits
        formatter.maximumFractionDigits = currencyFormat.decimalDigits

        guard let formattedCurrencyString = formatter.string(from: amountAsNumber)
        else {
            return nil
        }

        guard currencyFormat.displaySymbol
        else {
            return "\(formattedCurrencyString)"
        }

        if currencyFormat.symbolFirst {
            return "\(currencyFormat.currencySymbol)\(formattedCurrencyString)"
        } else {
            return "\(formattedCurrencyString)\(currencyFormat.currencySymbol)"
        }
    }
}
