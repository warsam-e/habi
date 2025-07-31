//
//  HabiManager.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import Combine
import CoreData
import Foundation

class HabiManager: ObservableObject {
  @Published var items: [HabiItem] = []
  private let context: NSManagedObjectContext

  public init(context: NSManagedObjectContext) {
    self.context = context
    _fetchItems()
  }

  func addItem(name: String, iconName: String) {

    let newItem = HabiItem(context: context)
    newItem.id = UUID()
    newItem.name = name
    newItem.icon_name = iconName
    newItem.created_at = Date()
    _saveContext()
    _fetchItems()
  }

  func removeItem(_ id: UUID) {
    let request: NSFetchRequest<HabiItem> = HabiItem.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
    if let itemsToDelete = try? context.fetch(request) {
      for item in itemsToDelete {
        context.delete(item)
      }
      _saveContext()
      _fetchItems()
    }
  }

  private func _fetchItems() {
    let request: NSFetchRequest<HabiItem> = HabiItem.fetchRequest()
    request.sortDescriptors = []
    items = (try? context.fetch(request)) ?? []
  }

  private func _saveContext() {
    if context.hasChanges {
      try? context.save()
    }
  }
}
