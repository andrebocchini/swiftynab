//
//  Account.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget account model
public struct Account: Codable, Equatable, Sendable {
    /// Account id
    public let id: String

    /// Account name
    public let name: String

    /// Account type
    public let type: AccountType

    /// Budget account or not
    public let onBudget: Bool

    /// Closed account or not
    public let closed: Bool

    /// Note on the account
    public let note: String?

    /// Account balance
    public let balance: Int

    /// Cleared account balance
    public let clearedBalance: Int

    /// Uncleared account balance
    public let unclearedBalance: Int

    /// Payee id for transfers
    public let transferPayeeId: String?

    /// Indicates whether the account is linked via direct import
    public let directImportLinked: Bool

    /// Indicates whether direct import is in an error state
    public let directImportInError: Bool

    /// Date when account was last reconciled
    public let lastReconciledAt: String?

    /// Original balance for a debt account
    public let debtOriginalBalance: Int?

    /// Interest rate at different points in time
    public let debtInterestRates: [String: Int]?

    /// Minimum payment at different points in time
    public let debtMinimumPayments: [String: Int]?

    /// Escrow amount at different points in time
    public let debtEscrowAmounts: [String: Int]?

    /// Deleted account or not
    public let deleted: Bool
}
