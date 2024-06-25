//
//  ContentView.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/20/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationStack {
            List{
                NavigationLink(destination: SegmentTestView()) {
                    Text("Segment Test View")
                }
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
            .navigationTitle("Main Menu")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
