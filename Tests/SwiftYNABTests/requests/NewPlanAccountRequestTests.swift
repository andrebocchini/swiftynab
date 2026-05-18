//
//  NewPlanAccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("New Plan Account Request")
struct NewPlanAccountRequestTests {
    @Test("Request uses POST method with account details in body")
    func newBudgetAccountRequest() throws {
        let request = NewPlanAccountRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            name: "name",
            type: .checking,
            balance: 0
        )

        #expect(request.path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let expectedBody = NewPlanAccountRequest.PostAccountWrapper(
            name: "name",
            type: .checking,
            balance: 0
        )
        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(
            NewPlanAccountRequest.PostAccountWrapper.self,
            from: body
        )
        #expect(decodedBody == expectedBody)
    }

    @Test("Multi-word account types encode as camelCase per the API spec")
    func multiWordAccountTypeEncoding() throws {
        for type in [SaveAccountType.creditCard, .otherAsset, .otherLiability] {
            let request = NewPlanAccountRequest(
                planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                name: "name",
                type: type,
                balance: 0
            )
            let body = try #require(request.body)
            let json = try #require(String(data: body, encoding: .utf8))

            #expect(json.contains("\"type\" : \"\(type.rawValue)\""))
        }
    }
}
