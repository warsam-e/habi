//
//  TodayTab.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct TodayTab: View {
  @EnvironmentObject var manager: HabiManager

  var listView: some View {
    ForEach(manager.items, id: \.id) { item in
      TodayItemView(item: item)
    }
  }

  var body: some View {
    NavigationStack {
      List {
        if manager.items.isEmpty {
          Text("No items yet. Head over to the List tab to add some.")
            .foregroundColor(.secondary)
            .padding()
        } else {
          listView
        }
      }
      .navigationTitle(Text("Today"))
    }
  }
}
