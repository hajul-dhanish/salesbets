import 'package:flutter/material.dart';
import 'package:salesbets/feature/team_profile/team_profile_view.dart';
import 'package:salesbets/models/team_model.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  const TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TeamProfileScreen(team: team),
          ),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(team.mascotUrl, width: 80, height: 80),
            ),
            const SizedBox(height: 8),
            Text(
              team.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              team.sport,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
