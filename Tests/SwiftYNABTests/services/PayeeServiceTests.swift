//
//  PayeeServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class PayeeServiceTests: XCTestCase {
    func testGetPayeesReturnsPayeesWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = PayeesRequest.Response(payees: [expectedPayee], serverKnowledge: 1)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.getPayees(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.count, 1)
        XCTAssertEqual(expectedPayee, actualResponse[0])
    }

    func testGetPayeesThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        do {
            _ = try await service.getPayees(budgetId: "budget_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetPayeeReturnsPayeeWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = PayeeRequest.Response(payee: expectedPayee)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.getPayee(budgetId: "budget_id", payeeId: "payee_id")

        XCTAssertEqual(expectedPayee, actualResponse)
    }

    func testGetPayeeThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        do {
            _ = try await service.getPayee(budgetId: "budget_id", payeeId: "payee_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdatePayeeReturnsPayeeWhenRequestSucceeds() async throws {
        let expectedPayee = Payee(id: "id", name: "name", transferAccountId: nil, deleted: false)
        let expectedResponse = UpdatePayeeRequest.Response(
            payee: expectedPayee,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = PayeeService(client: client)
        let actualResponse = try await service.updatePayee(
            budgetId: "budget_id",
            payeeId: "payee_id",
            payee: SavePayee(name: "name")
        )

        XCTAssertEqual(actualResponse.0, expectedPayee)
        XCTAssertEqual(actualResponse.1, 200)
    }

    func testUpdatePayeeThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = PayeeService(client: client)

        do {
            _ = try await service.updatePayee(
                budgetId: "id",
                payeeId: "name",
                payee: SavePayee(name: "name")
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
