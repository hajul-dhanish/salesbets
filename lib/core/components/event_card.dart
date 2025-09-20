import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/core/components/bet_model_component.dart';
import 'package:salesbets/core/components/team_state.dart';
import 'package:salesbets/models/event_model.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/repository/app_state.dart';

class EventCard extends StatefulWidget {
  final Event event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _showWinAnimation = false;

  void _simulateWin(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final winAmount = Random().nextInt(500) + 100;
    appState.simulateWin(winAmount);
    setState(() {
      _showWinAnimation = true;
    });
    // Hide animation after a delay.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showWinAnimation = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final team1 = appState.teams.firstWhere(
      (t) => t.id == widget.event.team1Id,
    );
    final team2 = appState.teams.firstWhere(
      (t) => t.id == widget.event.team2Id,
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.event.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TeamStat(team: team1),
                    const Text(
                      'vs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    TeamStat(team: team2),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Show betting modal or screen.
                          _showBettingModal(context, widget.event, team1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Bet',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _simulateWin(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Simulate Win',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_showWinAnimation)
            Center(
              child: Container(
                color: Colors.black.withValues(alpha: .7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.military_tech,
                        color: Colors.yellow,
                        size: 80,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'YOU WON!',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontSize: 40,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showBettingModal(BuildContext context, Event event, Team team) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: BetModal(event: event, team: team),
        );
      },
    );
  }
}
