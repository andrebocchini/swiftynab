//
//  AccountRowView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/9/22.
//

import Foundation
import SwiftUI

struct AccountRowView: View {
    let account: Account

    var body: some View {
        HStack(spacing: 8) {
            VStack(spacing: 8) {
                Text(account.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(account.kind.display)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)

            Text(account.balance)
                .font(.subheadline)
                .frame(alignment: .trailing)
        }
    }
}
