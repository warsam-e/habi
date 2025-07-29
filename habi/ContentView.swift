//
//  ContentView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("Today", systemImage: "text.rectangle.page") {
        TodayTab()
      }
      Tab("List", systemImage: "rectangle.stack") {
        ListTab()
      }
      Tab("Settings", systemImage: "gear") {
        SettingsTab()
      }
    }
  }
}

#Preview {
  ContentView()
}
