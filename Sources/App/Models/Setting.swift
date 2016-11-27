//
//  Setting.swift
//  ToDoServer
//
//  Created by Guy Kahlon on 11/27/16.
//
//

import Vapor

enum TextSize: Int {
  case small = 1
  case Medium
  case Big
}

enum TextStyle: Int {
  case light = 1
  case regular
  case medium
  case bold
}

enum Mode: Int {
  case light = 1
  case dark
}

enum Orientation: Int {
  case portrait = 1
  case landscape
}

final class Setting: Model {
  
  var id: Node?
  var exists: Bool = false
  
  
  var textSize: String
  var textStyle: String
  var mode: String
  var orientation: String
  
  init() {
    self.id = nil
    self.textSize = "textSize"
    self.textStyle = "textStyle"
    self.mode = "mode"
    self.orientation = "orientation"
  }

  init(textSize: TextSize, textStyle: TextStyle, mode: Mode, orientation: Orientation) {
    self.id = nil
    self.textSize = "textSize"
    self.textStyle = "textStyle"
    self.mode = "mode"
    self.orientation = "orientation"
  }

  init(node: Node, in context: Context) throws {
    id = try node.extract("id")
    textSize = try node.extract("textSize")
    textStyle = try node.extract("textStyle")
    mode = try node.extract("mode")
    orientation = try node.extract("orientation")
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try Node(node: [
        "id": id,
        "textSize": textSize,
        "textStyle": textStyle,
        "mode": mode,
        "orientation": orientation,
      ])
  }
  
  static func prepare(_ database: Database) throws {
    try database.create("settings") { users in
      users.id()
      users.string("textSize")
      users.string("textStyle")
      users.string("mode")
      users.string("orientation")
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete("settings")
  }
}

