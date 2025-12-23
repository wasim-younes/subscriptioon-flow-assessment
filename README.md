# Flutter Paywall & Onboarding Task

A modular Flutter application demonstrating a complete user flow: Onboarding -> Paywall -> Subscription Persistence.

## 🏗 Architecture & Patterns
I implemented the MVVM (Model-View-ViewModel) pattern to ensure a clean separation of concerns:
* Model: Defines the data structure for subscription plans.
* View: Handles the UI layout and user interaction.
* ViewModel: Manages the business logic and state using ChangeNotifier and Provider.
* Service Layer: Handles persistent storage via shared_preferences.

## 📂 Project Structure
* lib/models/: Subscription plan data models.
* lib/services/: Persistence logic for subscription status.
* lib/viewmodels/: Logic for onboarding navigation and purchase emulation.
* lib/views/: UI screens for Onboarding, Paywall, and Home.
* lib/views/widgets/: Extracted reusable components like PlanCard.

## 🤖 AI-Human Synergy
This project was developed using a "Developer + AI" partnership:
* AI Scaffolding: Used for rapid generation of boilerplate code and initial UI layouts.
* Manual Refinement: I manually implemented the Stack-based "Best Value" badge and handled Async Gaps in the ViewModels to ensure code quality.
* Optimization: Used AI to refactor monolithic views into modular, reusable widgets.

## 🚀 Key Features
* Persistent State: The app remembers subscription status; once "purchased," it skips directly to the Home screen on restart.
* Usability: Onboarding includes clear navigation (Next buttons and Dot Indicators).
* Responsive UI: Used Flex-based layouts for cross-platform compatibility.

## 🛠 Setup & Installation
1. Clone the repository.
2. Run flutter pub get.
3. Run flutter run -d chrome (or your preferred device).

## 📺 Process Recording
You can watch the full development process, including the AI prompting and manual refactoring, here: 
[**Watch the Technical Demo**](https://youtu.be/oBEaQ0SEr_A)
