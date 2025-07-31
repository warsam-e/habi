import CoreData
import Foundation

@objc(HabiItem)
public class HabiItem: NSManagedObject {
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var icon_name: String?
  @NSManaged public var created_at: Date?
  @NSManaged public var item_to_completed: NSSet?  // Use NSSet for Core Data

  @nonobjc public class func fetchRequest() -> NSFetchRequest<HabiItem> {
    return NSFetchRequest<HabiItem>(entityName: "HabiItem")
  }

  public var completedItems: [HabiItemCompleted] {
    let set = item_to_completed as? Set<HabiItemCompleted> ?? []
    return Array(set)
  }

  public var isCompletedToday: Bool {
    let date = Date()
    for completed in completedItems {
      if let completedDate = completed.completed_at {
        if Calendar.current.isDate(completedDate, inSameDayAs: date) {
          return true
        }
      }
    }
    return false
  }
}
