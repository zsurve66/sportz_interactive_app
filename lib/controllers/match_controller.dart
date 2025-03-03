import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/match_model.dart';
import '../models/player_model.dart';
import '../services/match_service.dart';

class MatchController extends GetxController {
  var match = MatchModel(team1: "", team2: "", date: "", venue: "").obs;
  var players = <PlayerModel>[].obs;
  var selectedFilter = "All".obs;
  final MatchService _matchService = MatchService();
  final String apiUrl = "https://demo.sportz.io/nzin01312019187360.json";

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchMatchData();
  }

  Future<void> fetchMatchData() async {
    try {
      match.value = await _matchService.getMatchDetails(apiUrl);
      players.value = await _matchService.getPlayers(apiUrl);
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Failed to fetch match data");
    }
  }
}
