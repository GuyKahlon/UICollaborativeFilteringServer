import Vapor

enum EventType: String {
  case startApplication
  case manualEditPreference
  case acceptRecommendation
  case rejectRecommendation
}

final class EventItem: Model {
  
  var id: Node?
  var exists: Bool = false
  
  var eventType: EventType
  
  init(eventType: EventType) {
    self.id = nil
    self.eventType = eventType
  }
  
  init(node: Node, in context: Context) throws {
    id = try node.extract("id")
    eventType = EventType(rawValue: try node.extract("eventtype"))!
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try Node(node: [
      "id": id,
      "eventtype": eventType.rawValue
    ])
  }
  
  static func prepare(_ database: Database) throws {
    try database.create("eventitems") { users in
      users.id()
      users.string("eventtype")
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete("eventitems")
  }
}











