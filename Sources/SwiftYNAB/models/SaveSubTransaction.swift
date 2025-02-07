//
//  SaveSubTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a subtransaction to be saved
public struct SaveSubTransaction: Codable, Equatable, Sendable {
    /// The subtransaction amount in milliunits format
    public let amount: Int

    /// The payee ID for the subtransaction
    public let payeeId: String?

    /// The payee name. If provided and payeeId is null, will be used to resolve or create payee.
    public let payeeName: String?

    /// The category ID for the subtransaction
    public let categoryId: String?

    /// A memo for the subtransaction
    public let memo: String?

    /// Creates a new SaveSubTransaction instance
    /// - Parameters:
    ///   - amount: The subtransaction amount in milliunits format
    ///   - payeeId: The payee ID for the subtransaction
    ///   - payeeName: The payee name (used if payeeId is nil)
    ///   - categoryId: The category ID
    ///   - memo: A memo for the subtransaction
    public init(
        amount: Int,
        payeeId: String? = nil,
        payeeName: String? = nil,
        categoryId: String? = nil,
        memo: String? = nil
    ) {
        self.amount = amount
        self.payeeId = payeeId
        self.payeeName = payeeName
        self.categoryId = categoryId
        self.memo = memo
    }
}
