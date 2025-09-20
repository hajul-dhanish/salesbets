class User {
  String id;
  String name;
  int credits;
  List<String> followedTeams;
  List<String> achievements;

  User({
    required this.id,
    required this.name,
    this.credits = 1000,
    this.followedTeams = const [],
    this.achievements = const [],
  });
}
