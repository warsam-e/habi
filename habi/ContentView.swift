//
//  ContentView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI
import CoreData

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("Today", systemImage: "text.rectangle.page") { TodayTab() }
      Tab("List", systemImage: "rectangle.stack") { ListTab() }
      Tab("Settings", systemImage: "gear") { SettingsTab() }
    }
  }
}

// #Preview {
//   ContentView()
//   .environment()
// }

struct ContentViewPreview: PreviewProvider {
  @StateObject static var manager = HabiManager(
    context: PersistenceController.shared.container.viewContext)

  static var previews: some View {
    ContentView()
      .environmentObject(manager)
  }
}
