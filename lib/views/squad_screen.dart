import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportz_interactive_app/resource/app_assets.dart';
import '../controllers/match_controller.dart';
import '../models/player_model.dart';

class SquadScreen extends StatelessWidget {
  final MatchController controller = Get.put(MatchController());

  SquadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Squads")),
      body: Obx(() {
        if (controller.players.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: controller.players.length,
          itemBuilder: (context, index) =>
              _buildPlayerCard(controller.players[index]),
        );
      }),
    );
  }

  // Player Card with Gradient Background
  Widget _buildPlayerCard(PlayerModel player) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.black87],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: player.name,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(
              player.team == "India"
                  ? AppAssets.imgIndia
                  : AppAssets.imgNewZeland,
            ),
          ),
        ),
        title: Text(
          "${player.name} ${player.isCaptain ? '(C)' : ''} ${player.isWicketKeeper ? '(WK)' : ''}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          "Team: ${player.team}",
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.info_outline, color: Colors.white),
        onTap: () => _showPlayerDetails(Get.context!, player),
      ),
    );
  }

  // Improved Player Details Modal
  void _showPlayerDetails(BuildContext context, PlayerModel player) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: player.name,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    player.team == "India"
                        ? AppAssets.imgIndia
                        : AppAssets.imgNewZeland,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                player.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _infoRow("🏏 Batting Style", player.battingStyle),
              _infoRow("📊 Runs", player.battingRuns),
              _infoRow("⚡ Avg", player.battingAverage),
              _infoRow("🚀 SR", player.battingStrikeRate),
              const Divider(),
              _infoRow("🎯 Bowling Style", player.bowlingStyle),
              _infoRow("🥎 Wickets", player.bowlingWickets),
              _infoRow("📉 Economy", player.bowlingEconomy),
              _infoRow("⚖️ Avg", player.bowlingAverage),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.shade700,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text("Close",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // UI Helper for Info Rows
  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
