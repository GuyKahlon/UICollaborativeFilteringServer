//
//  UsageEvent.swift
//  ToDoServer
//
//  Created by Guy Kahlon on 1/20/17.
//
//

import Vapor

final class UsageEventItem: Model {
  
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
    try database.create("usageeventitems") { users in
      users.id()
      users.string("eventtype")
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete("usageeventitems")
  }
}












