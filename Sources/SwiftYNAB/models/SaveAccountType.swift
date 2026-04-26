//
//  SaveAccountType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 4/24/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// The type of account that can be created or updated.
public enum SaveAccountType: String, Codable, Sendable {
    case checking
    case savings
    case cash
    case creditCard
    case otherAsset
    case otherLiability
}
