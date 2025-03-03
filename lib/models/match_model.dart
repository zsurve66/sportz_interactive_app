class MatchModel {
  final String team1;
  final String team2;
  final String date;
  final String venue;

  MatchModel({
    required this.team1,
    required this.team2,
    required this.date,
    required this.venue,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    var matchInfo = json['Matchdetail'] ?? {};

    return MatchModel(
      team1: json['Teams']?.entries?.first.value['Name_Full'] ?? "Unknown Team",
      team2: json['Teams']?.entries?.last.value['Name_Full'] ?? "Unknown Team",
      date: matchInfo['Match']?['Date'] ?? "No Date",
      venue: matchInfo['Venue']?['Name'] ?? "Unknown Venue",
    );
  }
}
