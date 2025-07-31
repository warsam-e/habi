import CoreData
import Foundation

@objc(HabiItemCompleted)
public class HabiItemCompleted: NSManagedObject {
  @NSManaged public var id: UUID?
  @NSManaged public var completed_at: Date?
  @NSManaged public var completed_to_item: HabiItem?

  @nonobjc public class func fetchRequest() -> NSFetchRequest<HabiItemCompleted> {
    return NSFetchRequest<HabiItemCompleted>(entityName: "HabiItemCompleted")
  }
}
