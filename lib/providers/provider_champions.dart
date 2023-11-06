// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_lol/models/models.dart';

class ChampionsProvider extends ChangeNotifier {
  final String _baseUrl = 'league-of-legends-champions.onrender.com';
  List<Champion> onDisplayChampions = [];

  ChampionsProvider() {
    getOnDisplayChampions();
  }

  Future<void> getOnDisplayChampions() async {
    String champs = 'App/Champions';
    var url = Uri.https(_baseUrl, champs);
    final response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData);

    final dataChamp = Response.fromRawJson(response.body);
    onDisplayChampions = dataChamp.champInfo;

    notifyListeners();
  }
}
