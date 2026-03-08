//
//  DateConverterTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Date Converter")
struct DateConverterTests {
    @Test("Converts ISO date string to YYYY/MM/DD format")
    func dateStringFormat1() {
        let format = DateFormat(format: "YYYY/MM/DD")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "2015/02/25")
    }

    @Test("Converts ISO date string to YYYY-MM-DD format")
    func dateStringFormat2() {
        let format = DateFormat(format: "YYYY-MM-DD")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "2015-02-25")
    }

    @Test("Converts ISO date string to DD-MM-YYYY format")
    func dateStringFormat3() {
        let format = DateFormat(format: "DD-MM-YYYY")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "25-02-2015")
    }

    @Test("Converts ISO date string to DD/MM/YYYY format")
    func dateStringFormat4() {
        let format = DateFormat(format: "DD/MM/YYYY")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "25/02/2015")
    }

    @Test("Converts ISO date string to DD.MM.YYYY format")
    func dateStringFormat5() {
        let format = DateFormat(format: "DD.MM.YYYY")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "25.02.2015")
    }

    @Test("Converts ISO date string to MM/DD/YYYY format")
    func dateStringFormat6() {
        let format = DateFormat(format: "MM/DD/YYYY")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "02/25/2015")
    }

    @Test("Converts ISO date string to YYY.MM.DD format")
    func dateStringFormat7() {
        let format = DateFormat(format: "YYY.MM.DD")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "2015-02-25") == "2015.02.25")
    }

    @Test("Returns nil when converting an invalid date string to budget format")
    func budgetFormatDateStringIsNilWithInvalidDateString() {
        let format = DateFormat(format: "YYY.MM.DD")
        let converter = DateConverter(dateFormat: format)
        #expect(converter.budgetFormatDateString(from: "i am not a date") == nil)
    }

    @Test("Converts a Date to an ISO 8601 date string")
    func apiDateString() {
        let date = Date(timeIntervalSince1970: 1_556_717_342.216656)
        let dateString = DateConverter.iso8601DateString(from: date)
        #expect(dateString == "2019-05-01")
    }

    @Test("Converts an ISO 8601 date string to a Date")
    func date() {
        var expectedDateComponents = DateComponents()
        expectedDateComponents.month = 05
        expectedDateComponents.day = 01
        expectedDateComponents.year = 2019
        expectedDateComponents.timeZone = TimeZone.current
        expectedDateComponents.calendar = Calendar.current
        let expectedDate = expectedDateComponents.date!

        let calculatedDate = DateConverter.date(from: "2019-05-01")

        #expect(expectedDate == calculatedDate)
    }
}
