import 'dart:convert';
import 'package:api_lol/models/models.dart';

class Response {
  List<Champion> champInfo;

  Response({
    required this.champInfo,
  });

  factory Response.fromRawJson(String str) =>
      Response.fromJson(json.decode(str));

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        champInfo:
            List<Champion>.from(json["data"].map((x) => Champion.fromJson(x))),
      );
}
