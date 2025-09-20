class Team {
  final String id;
  final String name;
  final String mascotUrl;
  final String sport;
  final int wins;
  final int losses;
  bool isFollowing;

  Team({
    required this.id,
    required this.name,
    required this.mascotUrl,
    required this.sport,
    this.wins = 0,
    this.losses = 0,
    this.isFollowing = false,
  });
}