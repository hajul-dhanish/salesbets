import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/feature/team_profile/team_profile_view.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/repository/app_state.dart';

class TeamListTile extends StatelessWidget {
  final Team team;
  const TeamListTile({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(team.mascotUrl, width: 50, height: 50),
        ),
        title: Text(
          team.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(team.sport, style: const TextStyle(color: Colors.grey)),
        trailing: IconButton(
          icon: Icon(
            team.isFollowing ? Icons.favorite : Icons.favorite_border,
            color: team.isFollowing ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (team.isFollowing) {
              appState.unfollowTeam(team.id);
            } else {
              appState.followTeam(team.id);
            }
          },
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TeamProfileScreen(team: team),
            ),
          );
        },
      ),
    );
  }
}
