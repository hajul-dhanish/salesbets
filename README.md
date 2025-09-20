# Sales Bets: The Gamified Business Challenge Platform

## Project Overview

Sales Bets is a modern, mobile-first platform that gamifies business challenges and milestones. Inspired by the dynamic world of fantasy sports, this application allows users to place "no-loss" bets on teams, follow their progress in real-time, and watch live-streamed events. The core concept is a unique "win but never lose" betting mechanic, where users can only gain rewards and credits, making it a low-risk, high-engagement experience.

## Core Features

  * **Dashboard:** A dynamic home screen displaying ongoing events, trending teams, and live challenge updates.

  * **No-Loss Betting:** A simple and intuitive interface for placing bets. Users stake credits that can only be increased by winning; their initial stake is never at risk.

  * **Teams & Athletes:** Dedicated profile pages for each team and individual, complete with performance stats, a history of achievements, and the ability to follow for real-time notifications.

  * **Live Streaming:** An integrated live stream component with a chat overlay, allowing teams to broadcast key events directly to their followers.

  * **Wallet & Achievements:** A gamified credit system and achievement badges to reward user engagement and successful bets.

  * **Modern UI/UX:** A clean, dark-themed design with intuitive navigation and a guided onboarding experience for new users.

## Technical Stack

The application is built using the following technologies:

  * **Flutter:** The primary framework for building a cross-platform mobile application for iOS and Android.

  * **Firebase:** A comprehensive backend-as-a-service platform used for:

      * **Authentication:** User management with email/password and social login options.

      * **Cloud Firestore:** A NoSQL database for storing user profiles, bets, events, and real-time chat messages.

      * **Firebase Storage:** For hosting images and video thumbnails.

      * **Firebase Cloud Messaging (FCM):** To send push notifications for live streams and team updates.

## Local Setup and Installation

Follow these steps to set up and run the project on your local machine.

### Prerequisites

  * [Flutter SDK](https://flutter.dev/docs/get-started/install) installed and configured.

  * A physical device or emulator to run the app.

  * A **Firebase Project** set up and configured for both iOS and Android.

### Steps

1.  **Clone the Repository**

    ```
    git clone https://github.com/hajul-dhanish/salesbets.git
    cd salesbets

    ```

2.  **Install Dependencies**

    ```
    flutter pub get

    ```

3.  **Configure Firebase**

      * Create a new Firebase project in the Firebase Console.

      * Follow the instructions to add iOS and Android apps to your project.

      * Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files.

      * Place the `google-services.json` file in the `android/app` directory.

      * Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.

      * **Important:** Enable Firestore, Authentication, and Storage in your Firebase project.

4.  **Run the App**

    ```
    flutter run

    ```

    The application should now build and run on your connected device or emulator.