//
//  SaveTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a transaction to be saved or updated
public struct SaveTransaction: Codable, Equatable, Sendable {
    /// The ID of the transaction (only used when updating an existing transaction)
    public let id: String?

    /// The account ID for the transaction
    public let accountId: String?

    /// The transaction date in ISO format (e.g. 2016-12-01). Future dates not permitted.
    public let date: String?

    /// The transaction amount in milliunits format
    public let amount: Int?

    /// The payee ID for the transaction
    public let payeeId: String?

    /// The payee name. If provided and payeeId is null, will be used to resolve or create payee.
    public let payeeName: String?

    /// The category ID for the transaction
    public let categoryId: String?

    /// A memo for the transaction
    public let memo: String?

    /// The cleared status of the transaction
    public let cleared: ClearedStatus?

    /// Whether the transaction is approved
    public let approved: Bool?

    /// The transaction flag color
    public let flagColor: FlagColor?

    /// The subtransactions for a split transaction
    public let subtransactions: [SaveSubTransaction]?

    /// The import ID if this is an imported transaction
    public let importId: String?

    /// Creates a new SaveTransaction instance
    /// - Parameters:
    ///   - id: The ID of the transaction (only used when updating an existing transaction)
    ///   - accountId: The account ID for the transaction
    ///   - date: The transaction date in ISO format (e.g. 2016-12-01). Future dates not permitted.
    ///   - amount: The transaction amount in milliunits format
    ///   - payeeId: The payee ID for the transaction
    ///   - payeeName: The payee name (used if payeeId is nil)
    ///   - categoryId: The category ID
    ///   - memo: A memo for the transaction
    ///   - cleared: The cleared status
    ///   - approved: Whether the transaction is approved
    ///   - flagColor: The transaction flag color
    ///   - subtransactions: The subtransactions for a split transaction
    ///   - importId: The import ID for imported transactions
    public init(
        id: String? = nil,
        accountId: String? = nil,
        date: String? = nil,
        amount: Int? = nil,
        payeeId: String? = nil,
        payeeName: String? = nil,
        categoryId: String? = nil,
        memo: String? = nil,
        cleared: ClearedStatus? = nil,
        approved: Bool? = nil,
        flagColor: FlagColor? = nil,
        subtransactions: [SaveSubTransaction]? = nil,
        importId: String? = nil
    ) {
        self.id = id
        self.accountId = accountId
        self.date = date
        self.amount = amount
        self.payeeId = payeeId
        self.payeeName = payeeName
        self.categoryId = categoryId
        self.memo = memo
        self.cleared = cleared
        self.approved = approved
        self.flagColor = flagColor
        self.subtransactions = subtransactions
        self.importId = importId
    }
}
