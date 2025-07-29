//
//  MainTab.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct ListTab: View {
  @StateObject private var manager = HabiManager.shared

  @State private var showingPrompt = false
  @State private var inputText = ""

  func addItem(_ name: String) {
    manager.addItem(name)
    inputText = ""
  }

  var addButton: some View {
    Button(action: { showingPrompt.toggle() }, label: { Image(systemName: "plus") })
      .alert("Enter name", isPresented: $showingPrompt) {
        TextField("Name", text: $inputText).textContentType(.name)
        Button("Cancel", role: .cancel) {}
        Button("Save") { addItem(inputText) }.disabled(inputText.isEmpty)
      }
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
