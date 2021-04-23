import 'dart:collection';

class Location {
  final String street;
  final String city;
  final String state;


  Location(this.street, this.city, this.state);

  Location.fromJson(Map<String, dynamic> json)
      : street = json["street"] as String,
        city = json["city"] as String,
        state = json["state"] as String;
}
class Name {
  final String title;
  final String first;
  final String last;

  Name(this.title, this.first, this.last);

  Name.fromJson(Map<String, dynamic> json)
      : title = json["title"] as String,
        first = json["first"] as String,
        last = json["last"] as String;
}
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture(this.large, this.medium, this.thumbnail);

  Picture.fromJson(Map<String, dynamic> json)
      : large = json["large"] as String,
        medium = json["medium"] as String,
        thumbnail = json["thumbnail"] as String;
}


class User {
  final String gender;
  final Name name;
  // final Location location;
  final String email;
  final Picture picture;

  User(this.gender, this.name, this.email, this.picture);

  User.fromJson(Map<String, dynamic> json)
      : gender = json["gender"] as String,
        name = Name.fromJson(json["name"] as Map<String,dynamic>),
        // location = Location.fromJson(json["location"]),
        email = json["email"] as String,
        picture = Picture.fromJson(json["picture"] as Map<String,dynamic>);

}


class UserResponse {
  final List<User> results;
  final String error;

  UserResponse(this.results, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : results =
  (json["results"] as List).map((i) => new User.fromJson(i as LinkedHashMap<String,dynamic>)).toList(),
        error = "";

  UserResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}