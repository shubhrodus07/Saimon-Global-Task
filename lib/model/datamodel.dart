import 'dart:convert';

Datamodel datamodelFromJson(String str) => Datamodel.fromJson(json.decode(str));

String datamodelToJson(Datamodel data) => json.encode(data.toJson());

class Datamodel {
  Datamodel({
    required this.result,
  });

  final Result result;

  factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.count,
    required this.packages,
  });

  final int count;
  final List<Package> packages;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        count: json["count"],
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}

class Package {
  Package({
    required this.uid,
    required this.title,
    required this.startingPrice,
    required this.thumbnail,
    required this.amenities,
    required this.discount,
    required this.durationText,
    required this.loyaltyPointText,
    required this.description,
  });

  final String uid;
  final String title;
  final int startingPrice;
  final String thumbnail;
  final List<Amenity> amenities;
  final dynamic discount;
  final String durationText;
  final String loyaltyPointText;
  final String description;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        uid: json["uid"],
        title: json["title"],
        startingPrice: json["startingPrice"],
        thumbnail: json["thumbnail"],
        amenities: List<Amenity>.from(
            json["amenities"].map((x) => Amenity.fromJson(x))),
        discount: json["discount"],
        durationText: json["durationText"],
        loyaltyPointText: json["loyaltyPointText"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "startingPrice": startingPrice,
        "thumbnail": thumbnail,
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "discount": discount,
        "durationText": durationText,
        "loyaltyPointText": loyaltyPointText,
        "description": description,
      };
}

class Amenity {
  Amenity({
    required this.title,
    required this.icon,
  });

  final Title title;
  final String icon;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        title: titleValues.map[json["title"]]!,
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "icon": icon,
      };
}

enum Title { PLANE, BUS, CAR, TRAIN }

final titleValues = EnumValues({
  "bus": Title.BUS,
  "car": Title.CAR,
  "plane": Title.PLANE,
  "train": Title.TRAIN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
