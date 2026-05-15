//
//  PlansView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/8/22.
//

import Foundation
import SwiftUI

struct PlansView: View {
    @Binding var token: String

    @State var viewModel: PlanViewModelType = PlanViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2, anchor: .center)
            } else if viewModel.isError {
                Text("Error loading plans!")
            } else {
                List(viewModel.plans, id: \.id) { plan in
                    NavigationLink {
                        AccountsView(
                            token: $token,
                            viewModel: AccountsViewModel(plan: plan)
                        )
                    } label: {
                        Text(plan.name)
                    }
                }
            }
        }
        .navigationTitle("Plans")
        .onAppear {
            Task {
                await viewModel.fetchPlans(using: token)
            }
        }
    }
}
