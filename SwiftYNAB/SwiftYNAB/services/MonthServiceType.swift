//
//  MonthServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol MonthServiceType {
    func getMonths(budgetId: String, lastKnowledgeOfServer: Int?) async throws -> [MonthSummary]

    func getMonth(budgetId: String, month: String) async throws -> MonthDetail
}
