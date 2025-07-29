#if !canImport(UIKit)  // Only include for SPM/non-Xcode builds
  import Foundation
  import CoreData

  class HabiItem: NSManagedObject {
    @NSManaged var id: UUID?
    @NSManaged var name: String?
    @NSManaged var icon_name: String?

    // SPM doesn't generate fetchRequest, so add it manually
    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabiItem> {
      return NSFetchRequest<HabiItem>(entityName: "HabiItem")
    }
  }
#endif
