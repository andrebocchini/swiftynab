//
//  ContentView.swift
//  SwiftYNAB-SwiftUI-demo
//
//  Created by Andre Bocchini on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var token: String = ""
    @State private var navigationPath = NavigationPath()
    @State private var isError = false

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .center, spacing: 8) {
                Text("Personal API Token")
                    .font(.title)
                TextField("Token Goes Here", text: $token)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                Button {
                    if token.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        isError = true
                    } else {
                        navigationPath.append(token)
                    }
                } label: {
                    Text("View Budgets")
                        .font(.title2)
                }
                .navigationDestination(for: String.self) { token in
                    BudgetsView(token: $token)
                }
                .alert("Error", isPresented: $isError) {
                    Button {
                        isError = false
                    } label: {
                        Text("Ok")
                    }
                } message: {
                    Text("You need to enter an API token")
                }
            }
            .padding(8)
        }
        .navigationTitle("Ynab Demo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
