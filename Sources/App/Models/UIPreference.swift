//
//  Preferences.swift
//  ToDoServer
//
//  Created by Guy Kahlon on 11/24/16.
//
//

import Vapor

enum TextSize: String {
  case small
  case medium
  case big
  
  var vactor: [Double] {
    switch self {
    case .small:
      return [1, 0, 0]
    case .medium:
      return [0, 1, 0]
    case .big:
      return [0, 0, 1]
    }
  }
  
  static func from(vector: (Double, Double, Double), preference: UIPreference8) -> TextSize {
    
    let n1 = vector.0
    let n2 = vector.1
    let n3 = vector.2
    
    
    let arr = [n1, n2, n3]
    let maxElement = arr.max()!
    
    let maxIndex = arr.index { $0 == maxElement }!
    
    switch maxIndex {
    case 0:
      return .small
    case 1:
      return .medium
    case 2:
      return .big
    default:
      fatalError()
    }
  }
}

enum TextStyle: String {
  case light
  case regular
  case medium
  case bold
  
  var vactor: [Double] {
    switch self {
    case .light:
      return [1, 0, 0, 0]
    case .regular:
      return [0, 1, 0, 0]
    case .medium:
      return [0, 0, 1, 0]
    case .bold:
      return [0, 0, 0, 1]
    }
  }
  
  static func from(vector: (Double, Double, Double, Double), preference: UIPreference8) -> TextStyle {
    
    let n1 = vector.0
    let n2 = vector.1
    let n3 = vector.2
    let n4 = vector.3
    
    let arr = [n1, n2, n3, n4]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .light
    case 1:
      return .regular
    case 2:
      return .medium
    case 3:
      return .bold
    default:
      fatalError()
    }
  }
}

enum TextColor: String {
  case light
  case sepia
  case dark
  
  var vactor: [Double] {
    switch self {
    case .light:
      return [1, 0, 0]
    case .sepia:
      return [0, 1, 0]
    case .dark:
      return [0, 0, 1]
    }
  }
  
  static func from(vector: (Double, Double, Double), preference: UIPreference8) -> TextColor {
    
    let n1 = vector.0
    let n2 = vector.1
    let n3 = vector.2
    
    let arr = [n1, n2, n3]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .light
    case 1:
      return .sepia
    case 2:
      return .dark
    default:
      fatalError()
    }
  }
}

enum Mode: String {
  case light
  case dark
  
  var vactor: [Double] {
    switch self {
    case .light:
      return [1, 0]
    case .dark:
      return [0, 1]
    }
  }
  
  static func from(vector: (Double, Double), preference: UIPreference8) -> Mode {
    
    let n1 = vector.0
    let n2 = vector.1
    
    
    let arr = [n1, n2]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .light
    case 1:
      return .dark
    default:
      fatalError()
    }
  }
}

enum Orientation: String {
  case portrait
  case landscape
  
  var vactor: [Double] {
    switch self {
    case .portrait:
      return [1, 0]
    case .landscape:
      return [0, 1]
    }
  }
  
  static func from(vector: (Double, Double), preference: UIPreference8) -> Orientation {
    
    let n1 = vector.0
    let n2 = vector.1
    
    let arr = [n1, n2]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .portrait
    case 1:
      return .landscape
    default:
      fatalError()
    }
    
  }
}

enum BackgroundColor: String {
  case white
  case sepia
  case night
  
  var vactor: [Double] {
    switch self {
    case .white:
      return [1, 0, 0]
    case .sepia:
      return [0, 1, 0]
    case .night:
      return [0, 0, 1]
    }
  }
  
  static func from(vector: (Double, Double, Double), preference: UIPreference8) -> BackgroundColor {
    
    let n1 = vector.0
    let n2 = vector.1
    let n3 = vector.2
    
    
    let arr = [n1, n2, n3]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .white
    case 1:
      return .sepia
    case 2:
      return .night
    default:
      fatalError()
    }
  }
}

enum DisplayZoom: String {
  case standard
  case zoomed
  
  var vactor: [Double] {
    switch self {
    case .standard:
      return [1, 0]
    case .zoomed:
      return [0, 1]
    }
  }
  
  static func from(vector: (Double, Double), preference: UIPreference8) -> DisplayZoom {
    
    let n1 = vector.0
    let n2 = vector.1
    
    
    let arr = [n1, n2]
    let max = arr.max()!
    
    let index = arr.index { $0 == max }!
    
    switch index {
    case 0:
      return .standard
    case 1:
      return .zoomed
    default:
      fatalError()
    }
  }
}

extension Float {
  
  var vactor: [Double] {
    switch self {
    case 0..<0.3:
      return [1,0,0]
      
    case 0.3..<0.6:
      
      return [1,0,0]
      
    default:
      return [1,0,0]
    }
  }
  
  static func from(vector: (Double, Double, Double)) -> Float {
    
    switch vector {
    case (_, 0.0, 0.0):
      return 0.0
    case (0.0, _, 0.0):
      return 0.3
    case (0.0, 0.0, _):
      return 0.6
    default:
      fatalError()
    }
  }
}

extension Bool {
  
  static func from(vector: (Double)) -> Bool {
    
    if vector > 0.0 {
      return true
    } else {
      return false
    }
  }
}

final class UIPreference8: Model {
  
  var id: Node?
  var exists: Bool = false
  
  
  var textSize: TextSize
  var textStyle: TextStyle
  var textColor: TextColor
  var mode: Mode
  var orientation: Orientation
  var backgroundColor: BackgroundColor
  var displayZoom: DisplayZoom
  var brightness: String
  var automaticBrightness: Bool
  var nightShift: Bool
  var language: Bool   // True English, False Device Language
  
  init(textSize: TextSize,
       textStyle: TextStyle,
       textColor: TextColor,
       mode: Mode,
       orientation: Orientation,
       backgroundColor: BackgroundColor,
       displayZoom: DisplayZoom,
       brightness: Float,
       automaticBrightness: Bool,
       nightShift: Bool,
       language: Bool) {
    
    self.id = nil
    self.textSize = textSize
    self.textStyle = textStyle
    self.textColor = textColor
    self.mode = mode
    self.orientation = orientation
    self.backgroundColor = backgroundColor
    self.displayZoom = displayZoom
    self.brightness = String(brightness)
    self.automaticBrightness = automaticBrightness
    self.nightShift = nightShift
    self.language = language
  }
  
  // MARK: - NodeRepresentable
  
  public func makeNode(context: Context) throws -> Node {
    return try Node(node: [
        "id": id,
        "textsize": textSize.rawValue,
        "textstyle": textStyle.rawValue,
        "textcolor": textColor.rawValue,
        "mode": mode.rawValue,
        "orientation": orientation.rawValue,
        "backgroundcolor": backgroundColor.rawValue,
        "displayzoom": displayZoom.rawValue,
        "brightness" : brightness,
        "automaticbrightness": automaticBrightness,
        "nightshift": nightShift,
        "language": language
      ])
  }
  
  // MARK: Model
  
  init(node: Node, in context: Context) throws {
    id = try node.extract("id")
    
    textSize = TextSize(rawValue: try node.extract("textsize"))!
    textStyle = TextStyle(rawValue: try node.extract("textstyle"))!
    textColor = TextColor(rawValue: try node.extract("textcolor"))!
    mode = try Mode(rawValue:node.extract("mode"))!
    orientation = Orientation(rawValue:try node.extract("orientation"))!
    backgroundColor = BackgroundColor(rawValue:try node.extract("backgroundcolor"))!
    displayZoom = DisplayZoom(rawValue:try node.extract("displayzoom"))!
    brightness = try node.extract("brightness")
    automaticBrightness = try node.extract("automaticbrightness")
    nightShift = try node.extract("nightshift")
    language = try node.extract("language")
  }
  
  static func prepare(_ database: Database) throws {
    
    //Note: Cannot use column with uppercase
    
    try database.create("UIPreference8s") { users in
      users.id()
      users.string("textsize")
      users.string("textstyle")
      users.string("textcolor")
      users.string("mode")
      users.string("orientation")
      users.string("backgroundcolor")
      users.string("displayzoom")
      users.string("brightness")
      users.bool("automaticbrightness")
      users.bool("nightshift")
      users.bool("language")
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete("UIPreference8s")
  }
  
  // MARK: CF
  
  var vector: [Double] {
    
    var v = [Double]()
    
    v.append(contentsOf: textSize.vactor)                  // 0-2
    v.append(contentsOf: textStyle.vactor)                 // 3-6
    v.append(contentsOf: textColor.vactor)                 // 7-9
    v.append(contentsOf: language ? [1] : [0])     // 10
    v.append(contentsOf: displayZoom.vactor)               // 11-12
    
    v.append(contentsOf: nightShift ? [1] : [0])           // 13
    
    v.append(contentsOf: automaticBrightness ? [1] : [0])  // 14
    
    let b = Float(brightness) ?? 0
    v.append(contentsOf: b.vactor)                         // 15-17
    
    v.append(contentsOf: backgroundColor.vactor)          // 18-20
    v.append(contentsOf: mode.vactor)                     // 21-22
    v.append(contentsOf: orientation.vactor)              // 23-24
    
    return v
  }
  
  init(id: Node, vector: [Double], preference: UIPreference8) {
    
    self.id = id
    if vector.count != 25 {
      fatalError()
    }
    
    let textSize = TextSize.from(vector:(vector[0], vector[1], vector[2]), preference: preference)
    self.textSize = textSize
    
    let textStyle = TextStyle.from(vector: (vector[3], vector[4], vector[5], vector[6]), preference: preference)
    self.textStyle = textStyle
    
    let textColor = TextColor.from(vector:(vector[7], vector[8], vector[9]), preference: preference)
    self.textColor = textColor
    
    let language = Bool.from(vector: (vector[10]))
    self.language = language
    
    let displayZoom = DisplayZoom.from(vector:(vector[11], vector[12]), preference: preference)
    self.displayZoom = displayZoom
   
    let nightShift = Bool.from(vector: (vector[13]))
    self.nightShift = nightShift
   
    let automaticBrightness = Bool.from(vector: (vector[14]))
    self.automaticBrightness = automaticBrightness
    
    let brithness = Float.from(vector:(vector[15], vector[16], vector[17]))
    self.brightness = String(brithness)
    
    let backgroundColor = BackgroundColor.from(vector:(vector[18], vector[19], vector[20]), preference: preference)
    self.backgroundColor = backgroundColor
    
    let mode = Mode.from(vector:(vector[21], vector[22]), preference: preference)
    self.mode = mode
    
    let orientation = Orientation.from(vector:(vector[23], vector[24]), preference: preference)
    self.orientation = orientation
  }
}
