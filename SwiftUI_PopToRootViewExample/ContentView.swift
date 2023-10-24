//
//  ContentView.swift
//  SwiftUI_PopToRootViewExample
//
//  Created by cano on 2023/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path: [Int] = []

    var body: some View {
        NavigationStack(path: $path) {

            Button("Start") {
                path.append(1)

            }
            .navigationDestination(for: Int.self) { int in
                DetailView(path: $path, count: int)
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {
    @Binding var path: [Int]

    let count: Int
    
    var body: some View {
        Button("Go deeper") {
            path.append(count + 1)
        }
        .navigationBarTitle(count.description)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Pop to Root") {
                    path = []
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
