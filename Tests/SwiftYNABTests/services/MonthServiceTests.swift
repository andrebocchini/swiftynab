//
//  MonthServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Month Service")
struct MonthServiceTests {
    @Test("Returns budget months when request succeeds")
    func monthsReturnsMonthsWhenRequestSucceeds() async throws {
        let expectedMonth = MonthSummary(
            month: "april",
            note: nil,
            income: 0,
            budgeted: 0,
            activity: 0,
            toBeBudgeted: 0,
            ageOfMoney: nil,
            deleted: false
        )
        let expectedResponse = MonthsRequest.Response(months: [expectedMonth], serverKnowledge: 200)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.months(
            budgetId: "budget_id",
            lastKnowledgeOfServer: 200
        )

        #expect(actualResponse.0.count == 1)
        #expect(expectedMonth == actualResponse.0[0])
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when fetching budget months fails")
    func monthsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.months(budgetId: "budget_id", lastKnowledgeOfServer: 200)
        }
    }

    @Test("Returns month detail when request succeeds")
    func monthReturnsMonthWhenRequestSucceeds() async throws {
        let expectedMonth = MonthDetail(
            month: "april",
            note: nil,
            income: 0,
            budgeted: 0,
            activity: 0,
            toBeBudgeted: 0,
            ageOfMoney: nil,
            deleted: false,
            categories: []
        )
        let expectedResponse = MonthRequest.Response(month: expectedMonth)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = MonthService(client: client)
        let actualResponse = try await service.month(budgetId: "budget_id", month: "april")

        #expect(expectedMonth == actualResponse)
    }

    @Test("Throws error when fetching month detail fails")
    func monthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = MonthService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.month(budgetId: "budget_id", month: "april")
        }
    }
}
