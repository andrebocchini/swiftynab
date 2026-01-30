//
//  DateConverter.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Converts dates to and from API-friendly strings
public struct DateConverter: Sendable {
    private static let iso8601DateFormat: Date.ISO8601FormatStyle = {
        var format = Date.ISO8601FormatStyle()
            .dateSeparator(.dash)
            .year()
            .month()
            .day()
        format.timeZone = .current

        return format
    }()

    private let dateFormat: DateFormat

    /// Initializes the formatter with date format information from a budget
    ///
    /// - Parameters:
    ///    - dateFormat: Date format information obtained from a budget
    public init(dateFormat: DateFormat) {
        self.dateFormat = dateFormat
    }

    /// Converts a date sent by the API into a displayable date according to the budget format
    ///
    /// - Parameters:
    ///    - from: A date string in the style (iso8601) sent by API responses (e.g. 2015/12/25)
    ///
    /// - Returns: A displayable date string if conversion is successful, `nil` if conversion fails.
    public func budgetFormatDateString(from apiDateString: String) -> String? {
        guard let inputDate = try? Self.iso8601DateFormat.parse(apiDateString)
        else {
            return nil
        }

        var budgetDateFormat = dateFormat.format.replacingOccurrences(of: "Y", with: "y")
        budgetDateFormat = budgetDateFormat.replacingOccurrences(of: "D", with: "d")

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = budgetDateFormat

        return formatter.string(from: inputDate)
    }

    /// Converts a date sent by the API into a `Date` object
    ///
    /// - Parameters:
    ///    - from: A date string in the style (iso8601) sent by API responses (e.g. 2015/12/25)
    ///
    /// - Returns: A `Date` object, or `nil` if conversion fails.
    public static func date(from apiDateString: String) -> Date? {
        try? iso8601DateFormat.parse(apiDateString)
    }

    /// Converts a date into a API-friendly iso8601 date string
    ///
    /// - Parameters:
    ///     - date: Date to be converted
    ///
    /// - Returns: API-friendly iso8601 date string
    public static func iso8601DateString(from date: Date) -> String {
        iso8601DateFormat.format(date)
    }
}
