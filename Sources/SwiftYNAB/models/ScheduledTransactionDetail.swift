//
//  ScheduledTransactionDetail.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Full details of a scheduled transaction
public struct ScheduledTransactionDetail: Codable, Equatable, Sendable {
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

    /// Account name
    public let accountName: String

    /// Payee id
    public let payeeId: String?

    /// Payee name
    public let payeeName: String?

    /// Category id
    public let categoryId: String?

    /// Category name
    public let categoryName: String?

    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?

    /// Whether or not the transaction has been deleted
    public let deleted: Bool

    /// Sub transactions associated with this transaction
    public let subtransactions: [ScheduledSubTransaction]
}

extension ScheduledTransactionDetail {
    init(
        id: String,
        dateFirst: String,
        dateNext: String,
        frequency: ScheduledTransactionFrequency,
        amount: Int,
        amountFormatted: String?,
        amountCurrency: Decimal?,
        memo: String?,
        flagColor: FlagColor?,
        accountId: String,
        accountName: String,
        payeeId: String?,
        payeeName: String?,
        categoryId: String?,
        categoryName: String?,
        transferAccountId: String?,
        deleted: Bool,
        subtransactions: [ScheduledSubTransaction]
    ) {
        self.init(
            id: id,
            dateFirst: dateFirst,
            dateNext: dateNext,
            frequency: frequency,
            amount: amount,
            amountFormatted: amountFormatted,
            amountCurrency: amountCurrency,
            memo: memo,
            flagColor: flagColor,
            flagName: nil,
            accountId: accountId,
            accountName: accountName,
            payeeId: payeeId,
            payeeName: payeeName,
            categoryId: categoryId,
            categoryName: categoryName,
            transferAccountId: transferAccountId,
            deleted: deleted,
            subtransactions: subtransactions
        )
    }
}
