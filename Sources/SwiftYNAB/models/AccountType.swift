//
//  AccountType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/9/25.
//

public enum AccountType: String, Codable, Sendable {
    case checking
    case savings
    case cash
    case creditCard
    case lineOfCredit
    case otherAsset
    case otherLiability
    case mortgage
    case autoLoan
    case studentLoan
    case personalLoan
    case medicalDebt
    case otherDebt
}
