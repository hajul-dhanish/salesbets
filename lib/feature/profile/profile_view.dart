// --- Profile Screen ---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/core/components/team_list_tile.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/repository/app_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 50),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appState.currentUser.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'ID: ${appState.currentUser.id}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildCreditsCard(context, appState.currentUser.credits),
            const SizedBox(height: 24),
            Text(
              'My Followed Teams',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            if (appState.followedTeams.isEmpty)
              const Text(
                'You are not following any teams.',
                style: TextStyle(color: Colors.grey),
              )
            else
              _buildFollowedTeamsList(context, appState.followedTeams),
            const SizedBox(height: 24),
            Text(
              'My Achievements',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildAchievementsGrid(context, appState.currentUser.achievements),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditsCard(BuildContext context, int credits) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Credits',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '💎 $credits',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const Icon(Icons.wallet_rounded, size: 50, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowedTeamsList(BuildContext context, List<Team> teams) {
    return Column(
      children: teams.map((team) => TeamListTile(team: team)).toList(),
    );
  }

  Widget _buildAchievementsGrid(
    BuildContext context,
    List<String> achievements,
  ) {
    if (achievements.isEmpty) {
      return const Text(
        'No achievements yet.',
        style: TextStyle(color: Colors.grey),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.military_tech, size: 40, color: Colors.yellow),
              const SizedBox(height: 8),
              Text(achievements[index], textAlign: TextAlign.center),
            ],
          ),
        );
      },
    );
  }
}
