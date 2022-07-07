//
//  TransactionType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Supported transaction types by the API
public enum TransactionType: String {
    /// Unapproved transaction
    case unapproved

    /// Uncategorized transaction
    case uncategorized
}
