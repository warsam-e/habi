//
//  HabiManager.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import Combine
import Foundation

class HabiManager: ObservableObject {
  @MainActor static let shared = HabiManager()
  private init() {}

  @Published var items: [HabiItem] = []

  func addItem(_ name: String) {
    let icons = ["plus", "star", "heart", "checkmark"]
    items.append(HabiItem(name: name, icon_name: icons.randomElement() ?? "plus"))
  }

  func removeItem(_ id: UUID) { items.removeAll { $0.id == id } }
}
