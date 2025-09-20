class Event {
  final String id;
  final String title;
  final String description;
  final String team1Id;
  final String team2Id;
  final DateTime date;
  final bool isLive;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.team1Id,
    required this.team2Id,
    required this.date,
    this.isLive = false,
  });
}
