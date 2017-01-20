import Vapor
import VaporPostgreSQL
//import Accelerate

// MARK: - Init Droplet 

let drop = Droplet(
  preparations: [UIPreference8.self, Event.self, UsageEvent.self],
  providers: [VaporPostgreSQL.Provider.self]
)

// MARK: - Data Base Operations

/*
 
 Return all the objects from DB
 
*/

drop.get("all") { request in
  return try JSON(node:
    UIPreference8.all().makeNode()
  )
}

/*
 
 Delete all the objects from DB
 
 */

drop.get("delete-all") { request in
  
  let query = try UIPreference8.query()
  try query.delete()
  return try JSON(node: UIPreference8.all().makeNode())
}

/*

  Return UIPrefernce by user ID
 
  Example Call: (Get)
  http://localhost:8080/user_id/1
*/


drop.get("/user_id",":userID") { request in
  if let userID = request.parameters["userID"]?.int {
    let node = try UIPreference8.query().filter("id", userID).first()?.makeNode()
    return try JSON(node: node)
  }
  return "Error retrieving parameters."
}

/*
 
 Create new UIPrefernce with default values (And save it in the DB)
 Return the new Prefernce.
 
*/

drop.get("default_preference") { request in
  
  var preference = UIPreference8(
    textSize: .small,
    textStyle: .regular,
    textColor: .dark,
    mode: .light,
    orientation: .portrait,
    backgroundColor: .white,
    displayZoom: .standard,
    brightness: 0.5,
    automaticBrightness: false,
    nightShift: true,
    language: true
  )
  
  try preference.save()
  
  return try JSON(node: preference.makeNode())
}

/*

 Update UIPreference 

*/

drop.post("update_preference") { request in
  
  let preference = try UIPreference8(node: request.json)
  
  var savedPreference = try UIPreference8.query().filter("id", preference.id!).first()
  
  guard var updatePreference = savedPreference else {
    throw Abort.badRequest
  }
  
  //TODO: Override = operator
  
  updatePreference.textSize = preference.textSize
  updatePreference.textStyle = preference.textStyle
  updatePreference.textColor = preference.textColor
  
  updatePreference.language = preference.language
  
  updatePreference.displayZoom = preference.displayZoom
  updatePreference.nightShift = preference.nightShift
  updatePreference.automaticBrightness = preference.automaticBrightness
  updatePreference.brightness = preference.brightness
  
  updatePreference.backgroundColor = preference.backgroundColor
  updatePreference.mode = preference.mode
  updatePreference.orientation = preference.orientation

  do {
    try updatePreference.save()
  } catch {
    print("Error = \(error)")
  }
  
  return try JSON(node: updatePreference.makeNode())
}

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




/*
 
 Return recommendations UIPrefernce for user by user id
 
 Example Call: (Get)
 http://localhost:8080/recommendations/user_id/1
 */


drop.get("recommendations/user_id",":userID") { request in
 
  
//  func calculateRecomendations(_ B: [Double], row: UInt, column: UInt, Pv: [Double]) -> [Double] {
//    
//    var Btranspose = [Double](repeating: 0.0, count: B.count)
//    vDSP_mtransD(B, 1, &Btranspose, 1, column, row)
//    
//    
//    let rows_of_matrix_BT = column
//    let columns_of_matrix_B = column
//    let columns_of_matrix_BT_or_rows_of_matrix_B = row
//    
//    var BTB = [Double](repeating: 0.0, count: Int(column) * Int(column))
//    
//    vDSP_mmulD(Btranspose, 1,
//               B, 1,
//               &BTB, 1,
//               rows_of_matrix_BT,
//               columns_of_matrix_B,
//               columns_of_matrix_BT_or_rows_of_matrix_B)
//    
//    
//    
//    var Rv = [Double](repeating: 0.0, count: Int(column))
//    
//    vDSP_mmulD(BTB, 1,
//               Pv, 1,
//               &Rv, 1,
//               column,
//               1,
//               column)
//    
//    
//    
//    return Rv
//  }
  
  /*
  1. Get the user preferences
  2. Create the T
  3. Calculate the recommendations
   */
  
  if let userID = request.parameters["userID"]?.int {
    
    //1
    let node = try UIPreference8.query().filter("id", userID).first()?.makeNode()
    let userPreference = try UIPreference8(node: node)
    
  
    //2
    let allPreferences = try UIPreference8.query().filter("id", .notEquals, userID).all()
    
    var table = userPreference.vector
    table += allPreferences.map { $0.vector }.flatMap { $0 }
    
    
    return try JSON(node: [
      "count" : String(allPreferences.count + 1),
      "table" : table.makeNode()
    ])
    
//    let res = calculateRecomendations(table,
//                                      row: UInt(allPreferences.count + 1),
//                                      column: 25,
//                                      Pv: userPreference.vector)
//    
//    let userRecommendationVector = Array(res[0..<25])
//    
    //let userRecommendatio = UIPreference8(id: nil, vector: userRecommendationVector, preference: userPreference)

//    return try JSON(node: userRecommendatio.makeNode())
    
    //return try JSON(node: table.makeNode())
  }
  
  return "Error retrieving parameters."
}




//let preferencesController = PreferencesController()
//drop.resource("preferences", preferencesController)








//drop.get("beers", Int.self) { request, beers in
//  return "Pass it around \(beers) :)"
//}
//
//let basic = BasicController()
//basic.addRoutes(drop: drop)

//DD






//Create Test Preferences Object







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
  //let node = try UIPreference.query().filter("textSize", .notEquals, TextSize.small.rawValue).all().makeNode()
//  return try JSON(node: node)
//}
//


// MARK: - Statistics
//8080/send_event?eventType=2
drop.get("send_event") { request in
  
  guard let eventTypeString = request.data["eventType"]?.string,
    let eventType = EventType(rawValue: eventTypeString) else {
    throw Abort.badRequest
  }
  var event = Event(eventType: eventType)
  try event.save()
  return try JSON(node: event.makeNode())
}

drop.get("all_events") { request in
  return try JSON(node:
    Event.all().makeNode()
  )
}

drop.get("send_usageevent") { request in
  
  guard let eventTypeString = request.data["eventType"]?.string,
    let eventType = EventType(rawValue: eventTypeString) else {
      throw Abort.badRequest
  }
  var event = UsageEvent(eventType: eventType)
  try event.save()
  return try JSON(node: event.makeNode())
}

drop.get("all_usageevent") { request in
  return try JSON(node:
    UsageEvent.all().makeNode()
  )
}


//
////Delete
//
//drop.get("delete-afks") { request in
//  
//  let query = try UIPreference.query().filter("textSize", TextSize.small.rawValue)
//  try query.delete()
//  return try JSON(node: UIPreference.all().makeNode())
//}

//drop.get("test") { request in
//
//  var preference = UIPreference8(
//    textSize: .small,
//    textStyle: .regular,
//    textColor: .dark,
//    mode: .light,
//    orientation: .portrait,
//    backgroundColor: .white,
//    displayZoom: .standard,
//    brightness: 0.5,
//    automaticBrightness: false,
//    nightShift: true,
//    language: true
//  )
//
//  try preference.save()
//
//  return try JSON(node: UIPreference8.all().makeNode())
//}

/**
 
 Create UIPreference for user withput saving
 
 */

//drop.get("model") { request in
//  
//  let preference = UIPreference8(
//    textSize: .small,
//    textStyle: .regular,
//    textColor: .dark,
//    mode: .light,
//    orientation: .portrait,
//    backgroundColor: .white,
//    displayZoom: .standard,
//    brightness: 0.5,
//    automaticBrightness: false,
//    nightShift: true,
//    language: true
//  )
//  
//  let json = try preference.makeJSON()
//  return json
//}

// MARK: - Utilities

// Get with out params jusr to check if the server live

drop.get { request in
  return try JSON(node: [
      "message" : "Welcome User Interface - Recommendation System Collaborative Filtering Study Project (And Analytics)"
    ])
}

// Return the Data-base version

drop.get("db_version") { request in
  if let db = drop.database?.driver as? PostgreSQLDriver {
    let version = try db.raw("SELECT version()")
    return try JSON(node: version)
  } else {
    return "No db connection"
  }
}

/**
 
 Create Defualt UIPreference for user and save it
 return all UIPreference from the DB
 
 */


// MARK: - Run

drop.run()












