//
//  SaveScheduledTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a scheduled transaction to be saved or updated
public struct SaveScheduledTransaction: Codable, Equatable, Sendable {
    /// The account ID for the scheduled transaction
    public let accountId: String

    /// The scheduled transaction date in ISO format (e.g. 2016-12-01). This should be a future date
    /// no more than 5 years into the future.
    public let date: Date

    /// The scheduled transaction amount in milliunits format
    public let amount: Int?

    /// The payee ID for the scheduled transaction
    public let payeeId: String?

    /// The payee name. If a payee_name value is provided and payee_id has a null value,
    /// the payee_name value will be used to resolve the payee by either (1) a payee with
    /// the same name or (2) creation of a new payee.
    public let payeeName: String?

    /// The category ID for the scheduled transaction. Credit Card Payment categories are not
    /// permitted.
    /// Creating a split scheduled transaction is not currently supported.
    public let categoryId: String?

    /// A memo for the scheduled transaction
    public let memo: String?

    /// The transaction flag color
    public let flagColor: FlagColor?

    /// The scheduled transaction frequency
    public let frequency: String

    /// Creates a new SaveScheduledTransaction instance
    /// - Parameters:
    ///   - accountId: The account ID for the scheduled transaction
    ///   - date: The scheduled transaction date (must be future date within 5 years)
    ///   - amount: The scheduled transaction amount in milliunits format
    ///   - payeeId: The payee ID for the scheduled transaction
    ///   - payeeName: The payee name (used if payeeId is nil)
    ///   - categoryId: The category ID (credit card payment categories not permitted)
    ///   - memo: A memo for the scheduled transaction
    ///   - flagColor: The transaction flag color
    ///   - frequency: The scheduled transaction frequency
    public init(
        accountId: String,
        date: Date,
        amount: Int? = nil,
        payeeId: String? = nil,
        payeeName: String? = nil,
        categoryId: String? = nil,
        memo: String? = nil,
        flagColor: FlagColor? = nil,
        frequency: String
    ) {
        self.accountId = accountId
        self.date = date
        self.amount = amount
        self.payeeId = payeeId
        self.payeeName = payeeName
        self.categoryId = categoryId
        self.memo = memo
        self.flagColor = flagColor
        self.frequency = frequency
    }
}
