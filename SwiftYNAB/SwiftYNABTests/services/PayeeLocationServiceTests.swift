//
//  PayeeLocationServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class PayeeLocationServiceTests: XCTestCase {
    func testGetPayeeLocationsReturnsLocationsWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = PayeeLocationsResponse(payeeLocations: [expectedLocation])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.getPayeeLocations(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedLocation, actualResponse[0])
    }

    func testGetPayeeLocationsThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        do {
            _ = try await service.getPayeeLocations(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetPayeeLocationReturnsLocationWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = PayeeLocationResponse(payeeLocation: expectedLocation)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.getPayeeLocation(
            budgetId: "budget_id",
            payeeId: "payee_id"
        )

        XCTAssertEqual(expectedLocation, actualResponse)
    }

    func testGetPayeeLocationThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        do {
            _ = try await service.getPayeeLocation(budgetId: "budget_id", payeeId: "payee_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testLocationsForPayeeReturnsLocationsWhenRequestSucceeds() async throws {
        let expectedLocation = PayeeLocation(
            id: "id",
            payeeId: "payee_id",
            longitude: "123",
            latitude: "123",
            deleted: false
        )
        let expectedResponse = PayeeLocationsResponse(payeeLocations: [expectedLocation])
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeLocationService(client: client)
        let actualResponse = try await service.getLocationsForPayee(
            budgetId: "budget_id",
            payeeId: "payee_id"
        )

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedLocation, actualResponse[0])
    }

    func testGetLocationsForPayeeThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeLocationService(client: client)

        do {
            _ = try await service.getLocationsForPayee(budgetId: "budget_id", payeeId: "payee_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
