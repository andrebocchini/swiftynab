//
//  SaveMonthCategory.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Model used for updating the budgeted amount for a categoryx
struct SaveMonthCategory: Codable {
    /// Budgeted amount for the category
    let budgeted: Int
}
