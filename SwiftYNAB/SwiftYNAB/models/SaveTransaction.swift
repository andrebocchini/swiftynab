//
//  SaveTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// YNAB calls the model SaveTransaction, but this name might be clearer when being passed as
/// a parameter to a a transaction creation method.
public typealias NewTransaction = SaveTransaction

/// YNAB calls the model SaveTransaction, but this name might be clearer when being passed as
/// a parameter to a a transaction update method.
public typealias UpdateTransaction = SaveTransaction

/// Model used for creating and updating transactions
public struct SaveTransaction: Codable {
    /// Transaction id.  Should be `nil` if this is a new transaction.  Should have a valid id for updating a transaction.
    public var id: String?

    /// Transaction date
    public var date: String

    /// Transaction amount
    public var amount: Int

    /// Transaction memo
    public var memo: String?

    /// Whether or not the transaction is cleared
    public var cleared: String

    /// Whether or not the transaction is approved
    public var approved: Bool

    /// Flag color
    public var flagColor: String?

    /// Id of the account the transaction belongs to
    public var accountId: String

    /// Payeed id
    public var payeeId: String?

    /// Payee name
    public var payeeName: String?

    /// Category id
    public var categoryId: String?

    /// Import id
    public var importId: String?

    /// Creates a an instance used for creating or updating transactions
    public init(
        id: String? = nil,
        date: String,
        amount: Int,
        accountId: String,
        payeeId: String? = nil,
        payeeName: String,
        importId: String? = nil
    ) {
        self.id = id
        self.date = date
        self.amount = amount
        cleared = "uncleared"
        approved = false
        self.accountId = accountId
        self.payeeId = payeeId
        self.payeeName = payeeName
        self.importId = importId
    }
}
