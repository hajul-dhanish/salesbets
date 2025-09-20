// --- Data Provider / State Management ---
// Using ChangeNotifier and Provider for simple state management.
// In a real app, this would handle all backend interactions.
import 'package:flutter/material.dart';
import 'package:salesbets/models/event_model.dart';
import 'package:salesbets/models/message_model.dart';
import 'package:salesbets/models/team_model.dart';
import 'package:salesbets/models/user_model.dart';

class AppState extends ChangeNotifier {
  // Mock data for demonstration purposes.
  final User _currentUser = User(
    id: 'user123',
    name: 'John Doe',
    credits: 1000,
  );
  final List<Event> _events = [
    Event(
      id: 'event1',
      title: 'Project Phoenix Pitch',
      description: 'The Phoenix team presents their Q4 strategy.',
      team1Id: 'team1',
      team2Id: 'team2',
      date: DateTime.now().add(const Duration(hours: 2)),
      isLive: true,
    ),
    Event(
      id: 'event2',
      title: 'Marketing Milestone Challenge',
      description: 'A bet on Q3 lead generation goals.',
      team1Id: 'team3',
      team2Id: 'team4',
      date: DateTime.now().add(const Duration(days: 1)),
      isLive: false,
    ),
  ];

  final List<Team> _teams = [
    Team(
      id: 'team1',
      name: 'Team Phoenix',
      mascotUrl: 'assets/images/team_phoenix.png',
      sport: 'Marketing',
      wins: 45,
      losses: 12,
    ),
    Team(
      id: 'team2',
      name: 'The Dragons',
      mascotUrl: 'assets/images/team_dragons.png',
      sport: 'Sales',
      wins: 38,
      losses: 15,
    ),
    Team(
      id: 'team3',
      name: 'Innovators United',
      mascotUrl: 'assets/images/team_innovators.png',
      sport: 'Engineering',
      wins: 51,
      losses: 8,
    ),
    Team(
      id: 'team4',
      name: 'Cosmic Coders',
      mascotUrl: 'assets/images/team_coders.png',
      sport: 'IT',
      wins: 29,
      losses: 20,
    ),
  ];

  final List<Message> _streamChat = [
    Message(
      sender: 'Alice',
      text: 'Go Team Phoenix!',
      timestamp: DateTime.now(),
    ),
    Message(
      sender: 'Bob',
      text: 'This is an awesome bet!',
      timestamp: DateTime.now(),
    ),
  ];

  User get currentUser => _currentUser;
  List<Event> get events => _events;
  List<Team> get teams => _teams;
  List<Team> get followedTeams =>
      _teams.where((team) => team.isFollowing).toList();
  List<Message> get streamChat => _streamChat;

  // Placeholder for Firebase Authentication.
  Future<void> signIn(String email, String password) async {
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    //   // Update user state from Firestore.
    // } catch (e) {
    // }
  }

  // Placeholder for Firebase Authentication.
  Future<void> signUp(String email, String password) async {
    // try {
    //   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    //   // Create a new user document in Firestore.
    // } catch (e) {
    // }
  }

  // Placeholder for Firestore operation.
  void placeBet(Team team, int amount) {
    // Update a bet document in Firestore.
    // This is where the 'no-loss' mechanic would live.
    // The user's credits would not be decremented.
  }

  // Placeholder for a win/reward mechanism.
  void simulateWin(int amount) {
    _currentUser.credits += amount;
    notifyListeners();
  }

  // Placeholder for Firestore operation.
  void followTeam(String teamId) {
    final team = _teams.firstWhere((t) => t.id == teamId);
    team.isFollowing = true;
    // Update the user's followed teams in Firestore.
    // Use FCM to subscribe to a topic for this team.
    notifyListeners();
  }

  // Placeholder for Firestore operation.
  void unfollowTeam(String teamId) {
    final team = _teams.firstWhere((t) => t.id == teamId);
    team.isFollowing = false;
    // Update the user's followed teams in Firestore.
    // Use FCM to unsubscribe from the topic.
    notifyListeners();
  }

  // Placeholder for Firestore operation.
  void sendMessage(String message) {
    _streamChat.add(
      Message(
        sender: _currentUser.name,
        text: message,
        timestamp: DateTime.now(),
      ),
    );
    // Add the message to a Firestore collection for the live stream.
    // This would be a real-time stream via `onSnapshot` for all viewers.
    notifyListeners();
  }
}
