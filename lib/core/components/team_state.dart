import 'package:flutter/material.dart';
import 'package:salesbets/models/team_model.dart';

class TeamStat extends StatelessWidget {
  final Team team;
  const TeamStat({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(team.mascotUrl, width: 60, height: 60),
        const SizedBox(height: 8),
        Text(team.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('${team.wins} wins', style: const TextStyle(color: Colors.green)),
      ],
    );
  }
}
