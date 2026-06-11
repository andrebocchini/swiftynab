//
//  UserService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to user operations
public struct UserService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension UserService: UserServiceType {
    public func user() async throws -> User {
        let request = UserRequest()
        let response = try await client.perform(request)
        return response.user
    }
}
