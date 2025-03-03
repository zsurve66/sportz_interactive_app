class PlayerModel {
  final String name;
  final String team;
  final String battingStyle;
  final String battingAverage;
  final String battingStrikeRate;
  final String battingRuns;
  final String bowlingStyle;
  final String bowlingAverage;
  final String bowlingEconomy;
  final String bowlingWickets;
  final bool isCaptain;
  final bool isWicketKeeper;

  PlayerModel({
    required this.name,
    required this.team,
    required this.battingStyle,
    required this.battingAverage,
    required this.battingStrikeRate,
    required this.battingRuns,
    required this.bowlingStyle,
    required this.bowlingAverage,
    required this.bowlingEconomy,
    required this.bowlingWickets,
    required this.isCaptain,
    required this.isWicketKeeper,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json, String teamName) {
    return PlayerModel(
      name: json['Name_Full'] ?? "Unknown",
      team: teamName,
      battingStyle: json['Batting']?['Style'] ?? "N/A",
      battingAverage: json['Batting']?['Average'] ?? "N/A",
      battingStrikeRate: json['Batting']?['Strikerate'] ?? "N/A",
      battingRuns: json['Batting']?['Runs'] ?? "N/A",
      bowlingStyle: json['Bowling']?['Style'] ?? "N/A",
      bowlingAverage: json['Bowling']?['Average'] ?? "N/A",
      bowlingEconomy: json['Bowling']?['Economyrate'] ?? "N/A",
      bowlingWickets: json['Bowling']?['Wickets'] ?? "N/A",
      isCaptain: json['Iscaptain'] ?? false,
      isWicketKeeper: json['Iskeeper'] ?? false,
    );
  }
}
