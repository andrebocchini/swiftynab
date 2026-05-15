//
//  Plan.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftYNAB

struct Plan: Identifiable {
    let id: String
    let name: String
    let currencyFormat: CurrencyFormat?
}

extension Plan {
    init(summary: PlanSummary) {
        id = summary.id
        name = summary.name
        currencyFormat = summary.currencyFormat
    }
}
