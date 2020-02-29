import 'package:json_annotation/json_annotation.dart';

class WorkerCollector {
  List<Results> results;

  WorkerCollector({this.results});

  WorkerCollector.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Results {
  String gender;
  Name name;
  Location location;
  String email;
  Dob dob;
  String phone;
  Picture picture;
  String nat;

  Results(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.dob,
      this.phone,
      this.picture,
      this.nat});

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    email = json['email'];
    dob = json['dob'] != null ? new Dob.fromJson(json['dob']) : null;
    phone = json['phone'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['email'] = this.email;
    if (this.dob != null) {
      data['dob'] = this.dob.toJson();
    }
    data['phone'] = this.phone;

    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    data['nat'] = this.nat;
    return data;
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Location {
  String city;
  String country;

  Location({
    this.city,
    this.country,
  });

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;

    return data;
  }
}

class Dob {
  String date;
  int age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['age'] = this.age;
    return data;
  }
}

class Picture {
  String large;
  String thumbnail;

  Picture({this.large, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
