## User Interface - Recommendation System Collaborative Filtering Study Project

The UICollaborativeFilteringServer is the server part of a Study Project.


### 🤔 The Big Idea 

What is collaborative filtering is all about?

Not so much wisdom of the crowd, just a matter of finding popular things, it will be almost trivial and the same thing to be recommended for every one.
It's more about finding the few people out there that have very similar taste yours and then recommending things that they felt, it's actually the wisdom of you.


### 🤝 Interduce some usese for collaborative filtering 

The best examples of the use of recommenders is the eCommerce websites such as Amazon (its estimated that about 60 percent of their sales come from recommendations in various places on thier site.) Once you login they have a lot of recommendations for you.
And not just those websites, today you can find recommendation system everywhere, Starting from Netflix that recomends for you about your next movie to dating websites that recomend for you about the perfect partner, and many more.


### 🤖 Algorithm
The algorithm is based on the co-occurrence of preferences between the user interface, actually is a way to find similar users in terms on user interface components preferences.

The struct the represent the user preference called: UIPreference


```swift

struct UIPreference {
  var id: Int
  var textSize: TextSize
  var textStyle: TextStyle
  var textColor: TextColor
  var mode: Mode
  var orientation: Orientation
  var backgroundColor: BackgroundColor
  var displayZoom: DisplayZoom
  var brightness: Float
  var automaticBrightness: Bool
  var nightShift: Bool
  var language: Bool //True = The user prefer English, False = The user prefer Device's Language
}

enum TextSize: String {
  case small
  case medium
  case big
}

enum TextStyle: String {
  case light
  case regular
  case medium
  case bold
}

enum TextColor: String {
  case light
  case sepia
  case dark
}

enum Mode: String {
  case light
  case dark
}

enum Orientation: String {
  case portrait
  case landscape
}

enum BackgroundColor: String {
  case white
  case sepia
  case night
}

enum DisplayZoom: String {
  case standard
  case zoomed
}
```

UIPreference knows to represent himself as a boolean vector of user preferences let's call it Vp

| User id|Text Size Small|Text Size Medium|Text Size Big|Text Style light|Test Style regular|Test Style medium|Test Style bold|Text Color light|Text Color sepia|Text Color dark|Language English|Device's language|Display standard|Display zoomed|Night Shift|Automatic Brithness|Brithness low|Brithness medium|Brithness high|Backgroun color white|Backgroun color sepia|Backgroun color night|Mode Light|Mode Dark|Orientation portrait|Orientation landscape|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
| 1 |❎ |✅ |❎ |❎  |✅ |❎ |❎ |❎ |❎ |✅ |✅  |❎ |✅ |❎ |✅  |✅ |❎ |❎ |❎  |❎  |✅ |❎  |✅ |❎ |✅ |❎  |




M = Table (Matrix) of all preferences for the users in the systems.
Rp = A vactor of recommendations for a specific users.
The equation:




### ✍️ API



## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for instructions on how to use this package.


## 💧 Community

The server hosted on [Heroku](https://www.heroku.com/).

Based on a web framework and server for Swift [Vapor](https://vapor.codes).
