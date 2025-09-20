// --- Home Screen ---
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/core/components/event_card.dart';
import 'package:salesbets/core/components/team_card.dart';
import 'package:salesbets/models/event_model.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/repository/app_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.wallet_rounded),
            onPressed: () {
              // Navigate to wallet
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreditsCard(context, appState.currentUser.credits),
            const SizedBox(height: 24),
            Text(
              'Live Challenges',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildEventList(
              context,
              appState.events.where((e) => e.isLive).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'Upcoming Challenges',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildEventList(
              context,
              appState.events.where((e) => !e.isLive).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'Trending Teams',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildTrendingTeams(context, appState.teams),
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
                  'Your Credits',
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
            const Icon(
              Icons.account_balance_wallet_rounded,
              size: 50,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList(BuildContext context, List<Event> events) {
    return Column(
      children: events.map((event) => EventCard(event: event)).toList(),
    );
  }

  Widget _buildTrendingTeams(BuildContext context, List<Team> teams) {
    final random = Random();
    final trendingTeams = List<Team>.from(teams)..shuffle(random);
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingTeams.length,
        itemBuilder: (context, index) {
          final team = trendingTeams[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TeamCard(team: team),
          );
        },
      ),
    );
  }
}
