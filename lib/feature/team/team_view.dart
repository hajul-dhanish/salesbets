// --- Teams Screen ---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/core/components/team_list_tile.dart';
import 'package:salesbets/repository/app_state.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teams & Athletes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appState.teams.length,
        itemBuilder: (context, index) {
          final team = appState.teams[index];
          return TeamListTile(team: team);
        },
      ),
    );
  }
}
