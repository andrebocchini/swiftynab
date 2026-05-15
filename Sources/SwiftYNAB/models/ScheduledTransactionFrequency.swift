//
//  ScheduledTransactionFrequency.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/14/26.
//

public enum ScheduledTransactionFrequency: String, Codable, Equatable, Sendable {
    case never
    case daily
    case weekly
    case everyOtherWeek
    case twiceAMonth
    case every4Weeks
    case monthly
    case everyOtherMonth
    case every3Months
    case every4Months
    case twiceAYear
    case yearly
    case everyOtherYear
}
