//
//  ScheduledTransactionServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol ScheduledTransactionServiceType {
    func getScheduledTransaction(budgetId: String, transactionId: String) async throws
        -> ScheduledTransactionDetail

    func getScheduledTransactions(budgetId: String) async throws -> [ScheduledTransactionDetail]
}
