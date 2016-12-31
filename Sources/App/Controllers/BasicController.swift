//
//  BasicController.swift
//  ToDoServer
//
//  Created by Guy Kahlon on 11/24/16.
//
//

import Vapor
import HTTP
import VaporPostgreSQL

final class BasicController {
 
  func addRoutes(drop: Droplet) {
    let basic = drop.grouped("basic")
    basic.get("version", handler: version)
  }
  
  //Return the DB version
  func version(request: Request) throws -> ResponseRepresentable {
    
    if let db = drop.database?.driver as? PostgreSQLDriver {
      let version = try db.raw("SELECT version()")
      return try JSON(node: version)
    } else {
      return "No db connection"
    }
  }
}
