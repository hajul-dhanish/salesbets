// --- Live Streams Screen ---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/core/components/team_chat_widget.dart';
import 'package:salesbets/repository/app_state.dart';

class LiveStreamsScreen extends StatelessWidget {
  const LiveStreamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final liveEvent = appState.events.firstWhere((e) => e.isLive);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Streams',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLiveStreamPlayer(context),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                liveEvent.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamChatWidget(chatMessages: appState.streamChat),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveStreamPlayer(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.play_circle_fill_rounded,
            size: 80,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
