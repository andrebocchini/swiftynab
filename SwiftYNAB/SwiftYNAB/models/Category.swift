//
//  Category.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Budget category
public struct Category: Codable {
    
    /// Category id
    public let id: String
    
    /// Category group id
    public let categoryGroupId: String
    
    /// Category name
    public let name: String
    
    /// Whether or not the category is hidden
    public let hidden: Bool
    
    /// Original category group id
    public let originalCategoryGroupId: String?
    
    /// Category note
    public let note: String?
    
    /// Amount budgeted to this category
    public let budgeted: Int
    
    /// Activity on this category
    public let activity: Int
    
    /// Current balance on this category
    public let balance: Int
    
    /// Type of goal associated with this category
    public let goalType: String?
    
    /// Goal creation month
    public let goalCreationMonth: String?
    
    /// Goal target amount
    public let goalTarget: Int
    
    /// Goal target date
    public let goalTargetMonth: String?
    
    /// Goal percentage complete
    public let goalPercentageComplete: Int?
    
    /// Whether or not the goal is deleted
    public let deleted: Bool
    
}
