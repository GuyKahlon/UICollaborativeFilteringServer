//
//  PreferencesController.swift
//  ToDoServer
//
//  Created by Guy Kahlon on 11/24/16.
//
//

import Vapor
import HTTP

//final class PreferencesController: ResourceRepresentable {
//  
//  func index(request: Request) throws -> ResponseRepresentable {
//    return try JSON(node: Preferences.all().makeNode())
//  }
//  
//  func create(request: Request) throws -> ResponseRepresentable {
//    var preferences = try request.preferences()
//    try preferences.save()
//    return preferences
//  }
//  
//  func show(request: Request, preferences: Preferences) throws -> ResponseRepresentable {
//    return preferences
//  }
//  
//  func update(request: Request, preferences: Preferences) throws -> ResponseRepresentable {
//    let new = try request.preferences()
//    var preferences = preferences
//    preferences.textSize = new.textSize
//    preferences.textStyle = new.textStyle
//    try preferences.save()
//    return preferences
//  }
//  
//  func delete(request: Request, preferences: Preferences) throws -> ResponseRepresentable {
//    try preferences.delete()
//    return JSON([:])
//  }
//  
//  func makeResource() -> Resource<Preferences> {
//    return Resource(
//      index: index,
//      store: create,
//      show: show,
//      modify: update,
//      destroy: delete
//    )
//  }
//}
//
//extension Request {
//  
//  func preferences() throws -> Preferences {
//  
//    guard let json = json else {
//      throw Abort.badRequest
//    }
//    return try Preferences(node: json)
//  }
//}
