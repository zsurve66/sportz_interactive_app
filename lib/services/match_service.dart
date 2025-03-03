import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/match_model.dart';
import '../models/player_model.dart';

class MatchService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchMatchData(String url) async {
    try {
      final response = await _dio.get(url);
      debugPrint("API Response: ${response.data}");
      return response.data;
    } catch (e) {
      debugPrint("Error fetching data: $e");
      throw Exception("Failed to load data");
    }
  }

  Future<MatchModel> getMatchDetails(String url) async {
    var data = await fetchMatchData(url);
    return MatchModel.fromJson(data);
  }

  Future<List<PlayerModel>> getPlayers(String url) async {
    var data = await fetchMatchData(url);
    List<PlayerModel> players = [];

    var teams = data['Teams'];
    if (teams == null) {
      debugPrint("No teams found!");
      return [];
    }

    teams.forEach((key, value) {
      var teamName = value['Name_Full'] ?? "Unknown Team";
      var teamPlayers = value['Players'] ?? {};

      teamPlayers.forEach((_, playerData) {
        players.add(PlayerModel.fromJson(playerData, teamName));
      });
    });

    return players;
  }
}
