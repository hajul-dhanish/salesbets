// --- Team Profile Screen ---
import 'package:flutter/material.dart';
import 'package:salesbets/models/team_model.dart';

class TeamProfileScreen extends StatelessWidget {
  final Team team;
  const TeamProfileScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          team.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(team.mascotUrl),
            ),
            const SizedBox(height: 16),
            Text(
              team.name,
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
            Text(team.sport, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn(
                      'Wins',
                      team.wins.toString(),
                      Colors.green,
                    ),
                    _buildStatColumn(
                      'Losses',
                      team.losses.toString(),
                      Colors.red,
                    ),
                    _buildStatColumn(
                      'Win Rate',
                      '${(team.wins / (team.wins + team.losses) * 100).toStringAsFixed(1)}%',
                      Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Recent Events',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Placeholder for recent events.
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No recent events yet.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
