//
//  CurrencyFormat.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Currency formatting settings
public struct CurrencyFormat: Codable {
    
    /// ISO code
    public let isoCode: String
    
    /// Example currency format
    public let exampleFormat: String
    
    /// Decimal digits to show
    public let decimalDigits: Int
    
    /// Decimal separator
    public let decimalSeparator: String
    
    /// Placement of currency symbol
    public let symbolFirst: Bool
    
    /// Group separator
    public let groupSeparator: String
    
    /// Currency symbol
    public let currencySymbol: String
    
    /// Whether or not to display the currency symbol
    public let displaySymbol: Bool
    
}
