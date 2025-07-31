//
//  MainTab.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct ListTab: View {
  @EnvironmentObject var manager: HabiManager

  @State private var showingSheet = false

  var addButton: some View {
    Button(action: { showingSheet.toggle() }, label: { Image(systemName: "plus") })
      .sheet(isPresented: $showingSheet) { AddSheet(showingSheet: $showingSheet) }
  }

  var listView: some View {
    ForEach(manager.items, id: \.id) { item in
      ListItemView(item: item)
    }
  }

  var body: some View {
    NavigationStack {
      List {
        if manager.items.isEmpty {
          Text("No items yet. Tap the plus button to add one.")
            .foregroundColor(.secondary)
            .padding()
        } else {
          listView
        }
      }

      .navigationTitle(Text("Habits"))
      .toolbar {
        addButton
      }
    }
  }
}
