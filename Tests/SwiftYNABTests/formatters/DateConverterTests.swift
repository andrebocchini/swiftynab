//
//  DateConverterTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class DateConverterTests: XCTestCase {
    func testDateStringFormat1() {
        let format = DateFormat(format: "YYYY/MM/DD")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("2015/02/25", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat2() {
        let format = DateFormat(format: "YYYY-MM-DD")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("2015-02-25", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat3() {
        let format = DateFormat(format: "DD-MM-YYYY")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("25-02-2015", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat4() {
        let format = DateFormat(format: "DD/MM/YYYY")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("25/02/2015", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat5() {
        let format = DateFormat(format: "DD.MM.YYYY")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("25.02.2015", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat6() {
        let format = DateFormat(format: "MM/DD/YYYY")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("02/25/2015", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testDateStringFormat7() {
        let format = DateFormat(format: "YYY.MM.DD")
        let converter = DateConverter(dateFormat: format)
        XCTAssertEqual("2015.02.25", converter.budgetFormatDateString(from: "2015-02-25"))
    }

    func testBudgetFormatDateStringIsNilWithInvalidDateString() {
        let format = DateFormat(format: "YYY.MM.DD")
        let converter = DateConverter(dateFormat: format)
        XCTAssertNil(converter.budgetFormatDateString(from: "i am not a date"))
    }

    func testApiDateString() {
        let date = Date(timeIntervalSince1970: 1_556_717_342.216656)
        let dateString = DateConverter.iso8601DateString(from: date)
        XCTAssertEqual("2019-05-01", dateString)
    }

    func testDate() {
        var expectedDateComponents = DateComponents()
        expectedDateComponents.month = 05
        expectedDateComponents.day = 01
        expectedDateComponents.year = 2019
        expectedDateComponents.timeZone = TimeZone.current
        expectedDateComponents.calendar = Calendar.current
        let expectedDate = expectedDateComponents.date!

        let calculatedDate = DateConverter.date(from: "2019-05-01")

        XCTAssertEqual(expectedDate, calculatedDate)
    }
}
