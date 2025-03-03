import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportz_interactive_app/resource/app_assets.dart';
import '../controllers/match_controller.dart';
import 'squad_screen.dart';

class MatchScreen extends StatelessWidget {
  final MatchController controller = Get.put(MatchController());

  MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match Details")),
      body: Obx(() {
        if (controller.match.value.team1.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              _buildMatchInfoCard(),
              const SizedBox(height: 20),
              _buildViewSquadsButton(),
            ],
          ),
        );
      }),
    );
  }

  ///  Match Info Card
  Widget _buildMatchInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.black87],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${controller.match.value.team1} vs ${controller.match.value.team2}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "${controller.match.value.date}  •  ${controller.match.value.venue}",
            style: const TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildTeamLogos(),
        ],
      ),
    );
  }

  ///  Team Logos & Names
  Widget _buildTeamLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTeamColumn(AppAssets.imgIndia, controller.match.value.team1),
        const Icon(Icons.sports_cricket, color: Colors.white, size: 28),
        _buildTeamColumn(AppAssets.imgNewZeland, controller.match.value.team2),
      ],
    );
  }

  Widget _buildTeamColumn(String imagePath, String teamName) {
    return Column(
      children: [
        Hero(
          tag: teamName,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.multiply,
            ),
            child: Image.asset(imagePath, height: 70),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  ///  View Squads Button
  Widget _buildViewSquadsButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.to(() => SquadScreen()),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent.shade700,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          "View Squads",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
