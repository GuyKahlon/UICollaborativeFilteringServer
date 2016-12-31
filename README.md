## User Interface - Recommendation System Collaborative Filtering Study Project

The UICollaborativeFilteringServer is the server part of the Study Project.


### 🤔 The Big Idea 

What is collaborative filtering is all about?

Not so much wisdom of the crowd, just a matter of finding popular things, it will be almost trivial and the same thing to be recommended for every one.
It's more about finding the few people out there that have very similar taste like yours, and then recommending things that they felt, it's actually the wisdom of you.


### 🤝 Introduce some usese for collaborative filtering 

The best examples for the use of recommenders is the eCommerce websites such as Amazon (its estimated that about 60 percent of their sales come from recommendations in various places on thier site.) Once you login they have a lot of recommendations for you.
And not just those websites, today you can find recommendation system everywhere, Starting from Netflix that recomends you the next movie you may like to dating websites that recomend you the perfect partner for you, and many more.


### 🤖 Algorithm

The algorithm is based on the co-occurrence of user interface preferences between users on the system, actually is a way to find similar users in terms on user interface components preferences.

The struct that represent the user preference called: UIPreference

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

UIPreference struct knows to represent himself as a boolean vector of user preferences let's call it **Pv** (we will use it in the equation further).
For example:

| User id|Text Size Small|Text Size Medium|Text Size Big|Text Style light|Test Style regular|Test Style medium|Test Style bold|Text Color light|Text Color sepia|Text Color dark|Language English|Device's language|Display standard|Display zoomed|Night Shift|Automatic Brithness|Brithness low|Brithness medium|Brithness high|Backgroun color white|Backgroun color sepia|Backgroun color night|Mode Light|Mode Dark|Orientation portrait|Orientation landscape|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
| 1 |❎ |✅ |❎ |❎  |✅ |❎ |❎ |❎ |❎ |✅ |✅  |❎ |✅ |❎ |✅  |✅ |❎ |❎ |❎  |❎  |✅ |❎  |✅ |❎ |✅ |❎  |

So all the data on the Data-base looks like that:

| User id|Text Size Small|Text Size Medium|Text Size Big|Text Style light|Test Style regular|Test Style medium|Test Style bold|Text Color light|Text Color sepia|Text Color dark|Language English|Device's language|Display standard|Display zoomed|Night Shift|Automatic Brithness|Brithness low|Brithness medium|Brithness high|Backgroun color white|Backgroun color sepia|Backgroun color night|Mode Light|Mode Dark|Orientation portrait|Orientation landscape|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
| 1 |❎ |✅ |❎ |❎  |✅ |❎ |❎ |❎ |❎ |✅ |✅  |❎ |✅ |❎ |✅  |✅ |❎ |❎ |❎  |❎  |✅ |❎  |✅ |❎ |✅ |❎ |
| 2 |✅ |✅ |✅ |❎  |✅ |❎ |❎ |❎ |❎ |✅ |✅  |❎ |✅ |❎ |✅  |✅ |❎ |❎ |❎  |❎  |✅ |❎  |✅ |❎ |✅ |❎ |
| 3 |✅ |❎ |❎ |❎  |✅ |❎ |❎ |❎ |❎ |✅ |✅  |❎ |✅ |❎ |✅  |✅ |❎ |❎ |❎  |❎  |✅ |❎  |✅ |❎ |✅ |❎ |
| 4 |
| 5 |


Let's call to the Data-bast table of all preferences **T**

The collaborative filtering algorithm should returns a vectro of user interface recommendation for a specific user let's call it **Rv**

The equation:

**Rv = [T**t**T]Pv**


## 📖 API Documentation

####Get All the users preferences.

Method: GET

URL:    /all

Rsponse: Array of JSON the present UI Preference.


####Get user preference by user id.

Method: GET

URL:    /user_id/<userid>

Rsponse: JSON the present UI Preference.

####Get default user preferences (for new user).

Method: GET

URL:    /default_preference

Rsponse: JSON the present UI Preference.


####Update user preference..

Method: POST

URL:    /update_preference
Parameters: JSON the present UI Preference

Rsponse: JSON the present UI Preference aftar updated.


####Get recommendation for user (by user id)

Method: GET

URL:    /recommendations/user_id/<userid>

Rsponse: JSON the present recommendation UI Preference.


####Get Data-Base version

Method: GET

URL:    /db_version

Rsponse: String with the data-base version or "No db connection".


## 💧 Community

The server hosted on [Heroku](https://www.heroku.com/).

Based on a web framework and server for Swift [Vapor](https://vapor.codes).

[PostgreSQL](https://www.postgresql.org/) - Open source object-relational database system.

