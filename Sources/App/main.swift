import Vapor
import VaporPostgreSQL


let drop = Droplet(
  preparations: [Acronym.self],
  providers: [VaporPostgreSQL.Provider.self]
)

//drop.get("/") { request in
//  return "Hello World!"
//}

drop.get("/name",":name") { request in
  if let name = request.parameters["name"]?.string {
    return "Hello \(name)!!!"
  }
  return "Error retrieving parameters."
}

drop.get { request in
  
  return try JSON(node: [
    
      "message" : "Hello, Vapor JSON !!!"
  ])
}

drop.get("beers", Int.self) { request, beers in
  return "Pass it around \(beers) :)"
}




drop.get("version") { request in
  
  if let db = drop.database?.driver as? PostgreSQLDriver {
    let version = try db.raw("SELECT version()")
    return try JSON(node: version)
  } else {
    return "No db connection"
  }
}

//DD

drop.get("model") { request in
  let ancronym = Acronym(short: "AFK", long: "Away From Keyboard")
  return try ancronym.makeJSON()
}


drop.get("test") { request in
  var ancronym = Acronym(short: "AFK", long: "Away From Keyboard")
  try ancronym.save()
  
  return try JSON(node:[
    Acronym.all().makeNode()
  ])
}


// MARK: - Run
drop.run()












