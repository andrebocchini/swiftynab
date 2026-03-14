//
//  PlanServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/25/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Plan Service")
struct PlanServiceTests {
    @Test("Returns plan summaries when request succeeds")
    func getPlansReturnsPlansWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedPlan = PlanSummary(
            id: "budget_id",
            name: "budget",
            lastModifiedOn: "2012-09-27",
            firstMonth: "january",
            lastMonth: "december",
            dateFormat: dateFormat,
            currencyFormat: currencyFormat,
            accounts: []
        )
        let expectedResponse = PlanSummaryRequest.Response(
            plans: [expectedPlan],
            defaultPlan: nil
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PlanService(client: client)
        let actualResponse = try await service.plans(includeAccounts: false)

        #expect(actualResponse.count == 1)
        #expect(expectedPlan == actualResponse[0])
    }

    @Test("Throws error when fetching plan summaries fails")
    func getPlansThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PlanService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.plans(includeAccounts: false)
        }
    }

    @Test("Returns plan detail when request succeeds")
    func getPlanReturnsPlanWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedPlan = PlanDetail(
            id: "budget_id",
            name: "budget_name",
            lastModifiedOn: "2012-09-27",
            firstMonth: "january",
            lastMonth: "december",
            dateFormat: dateFormat,
            currencyFormat: currencyFormat,
            accounts: [],
            payees: [],
            payeeLocations: [],
            categoryGroups: [],
            categories: [],
            months: [],
            transactions: [],
            subtransactions: [],
            scheduledTransactions: [],
            scheduledSubtransactions: []
        )
        let expectedResponse = PlanDetailRequest.Response(
            plan: expectedPlan,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PlanService(client: client)
        let actualResponse = try await service.plan(planId: "budget_id")

        #expect(expectedResponse.plan == actualResponse.0)
        #expect(expectedResponse.serverKnowledge == actualResponse.1)
    }

    @Test("Throws error when fetching plan detail fails")
    func getPlanThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PlanService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.plan(planId: "budget_id")
        }
    }

    @Test("Returns plan settings when request succeeds")
    func getPlanSettingsReturnsPlanSettingsWhenRequestSucceeds() async throws {
        let dateFormat = DateFormat(format: "XXXX-XX-XX")
        let currencyFormat = CurrencyFormat(
            isoCode: "USD",
            exampleFormat: "1.00",
            decimalDigits: 2,
            decimalSeparator: ".",
            symbolFirst: true,
            groupSeparator: ",",
            currencySymbol: "$",
            displaySymbol: true
        )
        let expectedSettings = PlanSettings(
            dateFormat: dateFormat,
            currencyFormat: currencyFormat
        )
        let expectedResponse = PlanSettingsRequest.Response(settings: expectedSettings)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PlanService(client: client)
        let actualResponse = try await service.planSettings(planId: "budget_id")

        #expect(expectedSettings == actualResponse)
    }

    @Test("Throws error when fetching plan settings fails")
    func getPlanSettingsThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PlanService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.planSettings(planId: "budget_id")
        }
    }
}
