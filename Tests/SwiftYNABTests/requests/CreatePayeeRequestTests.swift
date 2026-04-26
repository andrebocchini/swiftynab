//
//  CreatePayeeRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 4/24/26.
//

import Testing
@testable import SwiftYNAB

@Suite("Create Payee Request")
struct CreatePayeeRequestTests {
    @Test("Request uses POST method with payee data in body")
    func createPayeeRequest() throws {
        let payee = SavePayee(name: "Coffee Shop")
        let request = CreatePayeeRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            payee: payee
        )

        #expect(request.path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(SavePayeeWrapper.self, from: body)
        #expect(decodedBody == SavePayeeWrapper(with: payee))
    }
}
