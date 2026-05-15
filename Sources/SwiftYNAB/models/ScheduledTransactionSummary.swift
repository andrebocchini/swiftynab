//
//  ScheduledTransactionSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Summary of a scheduled transaction
public struct ScheduledTransactionSummary: Codable, Equatable, Sendable {
    /// Transaction id
    public let id: String

    /// First occurence of this transaction
    public let dateFirst: String

    /// Date of next occurrence
    public let dateNext: String

    /// How often the transaction happens
    public let frequency: ScheduledTransactionFrequency

    /// Amount of the transaction in milliunits
    public let amount: Int

    /// Amount of the transaction formatted in the plan currency
    public let amountFormatted: String?

    /// Amount of the transaction as a decimal currency amount
    public let amountCurrency: Decimal?

    /// Transaction memo
    public let memo: String?

    /// Flag color
    public let flagColor: FlagColor?

    /// Flag name
    public let flagName: String?

    /// Account id
    public let accountId: String

    /// Payee id
    public let payeeId: String?

    /// Category id
    public let categoryId: String?

    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?

    /// Whether or not the transaction has been deleted
    public let deleted: Bool
}
