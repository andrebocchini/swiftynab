//
//  CategoryGoalTargetUpdate.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/9/26.
//

/// The change to apply to a category's goal target.
public enum CategoryGoalTargetUpdate: Equatable, Sendable {
    /// Leaves the existing goal target unchanged by omitting it from the request.
    case unchanged

    /// Sets the goal target to the provided amount in milliunits.
    case set(Int64)

    /// Removes the existing goal target by sending an explicit `null` value.
    case remove
}
