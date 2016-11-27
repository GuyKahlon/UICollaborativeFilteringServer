import Vapor
import VaporPostgreSQL


let drop = Droplet(
  preparations: [Setting.self],
  providers: [VaporPostgreSQL.Provider.self]
)

drop.get { request in
  
  return try JSON(node: [
    "message" : "Hello, Vapor JSON !!!"
    ])
}

//Return the Data Base version
drop.get("version") { request in
  if let db = drop.database?.driver as? PostgreSQLDriver {
    let version = try db.raw("SELECT version()")
    return try JSON(node: version)
  } else {
    return "No db connection"
  }
}

//Create preferences for user withput saving

drop.get("model") { request in
  //  let preferences = UIPreference(textSize: .small,
  //                                 textStyle: .regular,
  //                                 mode: .light,
  //                                 orientation: .portrait)
  //
  //  return try preferences.makeJSON()
  
  let s = Setting()
  return try s.makeJSON()
}

drop.get("test") { request in
  
  //  var preferences = UIPreference(
  //    textSize: .small,
  //    textStyle: .regular,
  //    mode: .light,
  //    orientation: .portrait
  //  )
  //
  //  try preferences.save()
  //
  //  return try JSON(node:UIPreference.all().makeNode())
  
  var s = Setting()
  try s.save()
  
  return try JSON(node: Setting.all().makeNode())
}


//Return all the objects from DB

drop.get("all") { request in
  return try JSON(node: Setting.all().makeNode())
}

//let preferencesController = PreferencesController()
//drop.resource("preferences", preferencesController)




//drop.get("/name",":name") { request in
//  if let name = request.parameters["name"]?.string {
//    return "Hello \(name)!!!"
//  }
//  return "Error retrieving parameters."
//}



//drop.get("beers", Int.self) { request, beers in
//  return "Pass it around \(beers) :)"
//}
//
//let basic = BasicController()
//basic.addRoutes(drop: drop)

//DD






//Create Test Preferences Object



// MARK: - Data Base Operations



////Create a new preferences object and save at the DB
//drop.post("new") { request in
//  
//  var preferences = try UIPreference(node: request.json)
//  try preferences.save()
//
//  return preferences
//}
//
//
////Return the first object in the DB
//drop.get("first") { request in
//  return try JSON(node: UIPreference.query().first()?.makeNode())
//}
//
////Return all the preferences with text size small 
//drop.get("small") { request in
//  
//  let node = try UIPreference.query().filter("textSize", TextSize.small.rawValue).all().makeNode()
//  return try JSON(node: node)
//}
//
////Return all the preference with non small text size
//
//drop.get("non-small") { request in
//  
//  let node = try UIPreference.query().filter("textSize", .notEquals, TextSize.small.rawValue).all().makeNode()
//  return try JSON(node: node)
//}
//
////Update the first
////8080/update?=textSize=2
//drop.get("update") { request in
//  
//  guard var first = try UIPreference.query().first(), let textSize = request.data["textSize"]?.int else {
//    throw Abort.badRequest
//  }
//  
//  first.textSize = "1"//TextSize(rawValue: textSize)!.rawValue
//  try first.save()
//  return first
//}
//
////Delete
//
//drop.get("delete-afks") { request in
//  
//  let query = try UIPreference.query().filter("textSize", TextSize.small.rawValue)
//  try query.delete()
//  return try JSON(node: UIPreference.all().makeNode())
//}

// MARK: - Run
drop.run()












