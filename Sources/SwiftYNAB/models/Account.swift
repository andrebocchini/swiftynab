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

    /// Account type as returned by the server. Note this is the read-side enum and includes
    /// types (e.g. `.mortgage`, `.lineOfCredit`) that cannot be specified on creation.
    /// When creating an account, use ``SaveAccountType``.
    public let type: AccountType

    /// Budget account or not
    public let onBudget: Bool

    /// Closed account or not
    public let closed: Bool

    /// Note on the account
    public let note: String?

    /// Account balance
    public let balance: Int

    /// Account balance formatted in the plan currency
    public let balanceFormatted: String?

    /// Account balance as a decimal currency amount
    public let balanceCurrency: Decimal?

    /// Cleared account balance
    public let clearedBalance: Int

    /// Cleared account balance formatted in the plan currency
    public let clearedBalanceFormatted: String?

    /// Cleared account balance as a decimal currency amount
    public let clearedBalanceCurrency: Decimal?

    /// Uncleared account balance
    public let unclearedBalance: Int

    /// Uncleared account balance formatted in the plan currency
    public let unclearedBalanceFormatted: String?

    /// Uncleared account balance as a decimal currency amount
    public let unclearedBalanceCurrency: Decimal?

    /// Payee id for transfers
    public let transferPayeeId: String?

    /// Indicates whether the account is linked via direct import
    public let directImportLinked: Bool?

    /// Indicates whether direct import is in an error state
    public let directImportInError: Bool?

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

    public init(
        id: String,
        name: String,
        type: AccountType,
        onBudget: Bool,
        closed: Bool,
        note: String?,
        balance: Int,
        balanceFormatted: String?,
        balanceCurrency: Decimal?,
        clearedBalance: Int,
        clearedBalanceFormatted: String?,
        clearedBalanceCurrency: Decimal?,
        unclearedBalance: Int,
        unclearedBalanceFormatted: String?,
        unclearedBalanceCurrency: Decimal?,
        transferPayeeId: String?,
        directImportLinked: Bool?,
        directImportInError: Bool?,
        lastReconciledAt: String?,
        debtOriginalBalance: Int?,
        debtInterestRates: [String: Int]?,
        debtMinimumPayments: [String: Int]?,
        debtEscrowAmounts: [String: Int]?,
        deleted: Bool
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.onBudget = onBudget
        self.closed = closed
        self.note = note
        self.balance = balance
        self.balanceFormatted = balanceFormatted
        self.balanceCurrency = balanceCurrency
        self.clearedBalance = clearedBalance
        self.clearedBalanceFormatted = clearedBalanceFormatted
        self.clearedBalanceCurrency = clearedBalanceCurrency
        self.unclearedBalance = unclearedBalance
        self.unclearedBalanceFormatted = unclearedBalanceFormatted
        self.unclearedBalanceCurrency = unclearedBalanceCurrency
        self.transferPayeeId = transferPayeeId
        self.directImportLinked = directImportLinked
        self.directImportInError = directImportInError
        self.lastReconciledAt = lastReconciledAt
        self.debtOriginalBalance = debtOriginalBalance
        self.debtInterestRates = debtInterestRates
        self.debtMinimumPayments = debtMinimumPayments
        self.debtEscrowAmounts = debtEscrowAmounts
        self.deleted = deleted
    }
}
