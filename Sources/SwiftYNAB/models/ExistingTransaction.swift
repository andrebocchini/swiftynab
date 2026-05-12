//
//  ExistingTransaction.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/25.
//

public struct ExistingTransaction: Codable, Equatable, Sendable {
    public let accountId: String?
    public let date: String?
    public let amount: Int64?
    public let payeeId: String?
    public let payeeName: String?
    public let categoryId: String?
    public let memo: String?
    public let cleared: ClearedStatus?
    public let approved: Bool?
    public let flagColor: FlagColor?
    public let subtransactions: [SaveSubTransaction]?

    public init(
        accountId: String?,
        date: String?,
        amount: Int64?,
        payeeId: String?,
        payeeName: String?,
        categoryId: String?,
        memo: String?,
        cleared: ClearedStatus?,
        approved: Bool?,
        flagColor: FlagColor?,
        subtransactions: [SaveSubTransaction]?
    ) {
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
    }
}
