//
//  habiApp.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import CoreData
import SwiftUI

@main
struct habiApp: App {
  @StateObject private var manager = HabiManager(
    context: PersistenceController.shared.container.viewContext)

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(manager)
    }
  }
}
