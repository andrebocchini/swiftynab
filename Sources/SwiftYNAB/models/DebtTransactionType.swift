//
//  DebtTransactionType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/28/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import Foundation

public enum DebtTransactionType: String, Codable, Equatable, Sendable {
    case payment
    case refund
    case fee
    case interest
    case escrow
    case balanceAdjustment
    case credit
    case charge
}
