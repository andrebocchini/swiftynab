//
//  BudgetResponses.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

struct BudgetSummaryResponse: Codable {
    
    let data: BudgetSummaryWrapper
    
    struct BudgetSummaryWrapper: Codable {
        
        let budgets: [BudgetSummary]
        
    }
    
}


struct BudgetSettingsResponse: Codable {
    
    let data: BudgetSettingsWrapper

    struct BudgetSettingsWrapper: Codable {
        
        let settings: BudgetSettings
        
    }
    
}


struct BudgetDetailResponse: Codable {
    
    let data: BudgetDetailWrapper
  
    struct BudgetDetailWrapper: Codable {
        
        let budget: BudgetDetail
        
    }
    
}

struct NewBudgetAccountResponse: Codable {
    
    let data: NewBudgetAccountResponseWrapper
  
    struct NewBudgetAccountResponseWrapper: Codable {
        
        let account: Account
        
    }
    
}
