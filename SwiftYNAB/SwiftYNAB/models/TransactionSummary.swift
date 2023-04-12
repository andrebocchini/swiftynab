//
//  TransactionSummary.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Summary details of a transaction
public struct TransactionSummary: Codable, Equatable {
    /// Transaction id
    public let id: String

    /// Transaction date
    public let date: String

    /// Amount of the transaction in milliunits
    public let amount: Int

    /// Transaction memo
    public let memo: String?

    /// Whether or not the transaction has been cleared
    public let cleared: String

    /// Whether or not the transaction has been approved
    public let approved: Bool

    /// Flag color
    public let flagColor: String?

    /// Id of the account this transaction belongs to
    public let accountId: String

    /// Payee id
    public let payeeId: String?

    /// Category id
    public let categoryId: String?

    /// If it's a transfer transaction, the transfer account id
    public let transferAccountId: String?

    /// If it's a transfer transaction, the transfer transaction id
    public let transferTransactionId: String?

    /// If transaction is matched, the id of the matched transaction
    public let matchedTransactionId: String?

    /// If the transaction was imported, this field is a unique (by account) import identifier. If this transaction was imported through
    /// File Based Import or Direct Import and not through the API, the import_id will have the
    /// format: 'YNAB:[milliunit_amount]:[iso_date]:[occurrence]'. For example, a transaction dated 2015-12-30 in the amount
    /// of -$294.23 USD would have an import_id of 'YNAB:-294230:2015-12-30:1’. If a second transaction on the same
    /// account was imported and had the same date and same amount, its import_id would be 'YNAB:-294230:2015-12-30:2’.
    public let importId: String?

    /// If the transaction was imported, the payee name that was used when importing and before applying any payee rename rules
    public let importPayeeName: String?

    /// If the transaction was imported, the original payee name as it appeared on the statement
    public let importPayeeNameOriginal: String?

    /// If the transaction was imported, the original payee name as it appeared on the statement
    public let debtTransactionType: DebtTransactionType?

    /// Whether or not the transaction has been deleted
    public let deleted: Bool
}
