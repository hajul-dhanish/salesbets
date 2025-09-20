import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/models/event_model.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/repository/app_state.dart';

class BetModal extends StatefulWidget {
  final Event event;
  final Team team;
  const BetModal({super.key, required this.event, required this.team});

  @override
  State<BetModal> createState() => _BetModalState();
}

class _BetModalState extends State<BetModal> {
  double _betAmount = 100;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Place Your Bet',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Betting on: ${widget.team.name}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Amount: ${_betAmount.round()} credits',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Slider(
              value: _betAmount,
              min: 10,
              max: 500,
              divisions: 49,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey[800],
              label: _betAmount.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _betAmount = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                appState.placeBet(widget.team, _betAmount.round());
                Navigator.of(context).pop();
                // Show a success message.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Bet placed on ${widget.team.name}!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm Bet',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
