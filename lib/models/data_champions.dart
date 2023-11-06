// ignore_for_file: constant_identifier_names

import 'dart:convert';

class Champion {
  String id;
  String champion;
  String releaseDate;
  String img;
  String origen;
  Resource resource;
  List<Position> position;
  List<Hability> habilities;
  DateTime createdAt;
  DateTime updatedAt;

  Champion({
    required this.id,
    required this.champion,
    required this.releaseDate,
    required this.img,
    required this.origen,
    required this.resource,
    required this.position,
    required this.habilities,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Champion.fromRawJson(String str) =>
      Champion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Champion.fromJson(Map<String, dynamic> json) => Champion(
        id: json["_id"],
        champion: json["champion"],
        releaseDate: json["release_date"],
        img: json["img"],
        origen: json["origen"],
        resource: resourceValues.map[json["resource"]]!,
        position: List<Position>.from(
            json["position"].map((x) => Position.fromJson(x))),
        habilities: List<Hability>.from(
            json["habilities"].map((x) => Hability.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "champion": champion,
        "release_date": releaseDate,
        "img": img,
        "origen": origen,
        "resource": resourceValues.reverse[resource],
        "position": List<dynamic>.from(position.map((x) => x.toJson())),
        "habilities": List<dynamic>.from(habilities.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Hability {
  List<E> pasive;
  List<E> q;
  List<E> w;
  List<E> e;
  List<E> r;
  String id;

  Hability({
    required this.pasive,
    required this.q,
    required this.w,
    required this.e,
    required this.r,
    required this.id,
  });

  factory Hability.fromRawJson(String str) =>
      Hability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hability.fromJson(Map<String, dynamic> json) => Hability(
        pasive: List<E>.from(json["pasive"].map((x) => E.fromJson(x))),
        q: List<E>.from(json["q"].map((x) => E.fromJson(x))),
        w: List<E>.from(json["w"].map((x) => E.fromJson(x))),
        e: List<E>.from(json["e"].map((x) => E.fromJson(x))),
        r: List<E>.from(json["r"].map((x) => E.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "pasive": List<dynamic>.from(pasive.map((x) => x.toJson())),
        "q": List<dynamic>.from(q.map((x) => x.toJson())),
        "w": List<dynamic>.from(w.map((x) => x.toJson())),
        "e": List<dynamic>.from(e.map((x) => x.toJson())),
        "r": List<dynamic>.from(r.map((x) => x.toJson())),
        "_id": id,
      };
}

class E {
  String icon;
  String title;
  String description;
  String id;

  E({
    required this.icon,
    required this.title,
    required this.description,
    required this.id,
  });

  factory E.fromRawJson(String str) => E.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory E.fromJson(Map<String, dynamic> json) => E(
        icon: json["icon"],
        title: json["title"],
        description: json["description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "description": description,
        "_id": id,
      };
}

class Position {
  String icon;
  String role;
  String roleP;
  String id;

  Position({
    required this.icon,
    required this.role,
    required this.roleP,
    required this.id,
  });

  factory Position.fromRawJson(String str) =>
      Position.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        icon: json["icon"],
        role: json["role"],
        roleP: json["roleP"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "role": role,
        "roleP": roleP,
        "_id": id,
      };
}

enum Resource { ENERGIA, MANA, NINGUNO, STRING }

final resourceValues = EnumValues({
  "Energia": Resource.ENERGIA,
  "Mana": Resource.MANA,
  "ninguno": Resource.NINGUNO,
  "string": Resource.STRING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
