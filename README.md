#  RoboDash – Robot Companion Controller (Flutter)

RoboDash is a **high-performance Flutter application** developed as a technical assessment for **Pyramakerz** for the **Robot Companion Controller** role.

The project simulates a real-world robot control system, with strong focus on **Clean Architecture**, **scalability**, **testability**, and **real sensor integration**, while intentionally avoiding dependency on real backend servers or cloud AI services.

> **Note**: The robot, backend, and AI services are simulated by design. The architecture is fully prepared for real integrations.

---

##  Project Goals

* Demonstrate strong Flutter engineering fundamentals
* Apply Clean Architecture in a real-world–like scenario
* Handle real-time streams, sensors, and async workflows
* Showcase maintainable, testable, and extensible code

---
## Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="assets/screenshots/control_1.png" alt="Control 1" width="200" />
  <img src="assets/screenshots/control_2.png" alt="Control 2" width="200" />
  <img src="assets/screenshots/control_3.png" alt="Control 3" width="200" />
  <img src="assets/screenshots/control_4.png" alt="Control 4" width="200" />
  <img src="assets/screenshots/control_5.png" alt="Control 5" width="200" />
  <img src="assets/screenshots/more_screen.png" alt="More Screen 1" width="200" />
  <img src="assets/screenshots/more_screen_2.png" alt="More Screen 2" width="200" />
  <img src="assets/screenshots/more_screen_3.png" alt="More Screen 3" width="200" />
  <img src="assets/screenshots/splash_screen.png" alt="Splash Screen 1" width="200" />
  <img src="assets/screenshots/splash_screen_2.png" alt="Splash Screen 2" width="200" />
  <img src="assets/screenshots/telemetry_1.png" alt="Telemetry 1" width="200" />
  <img src="assets/screenshots/telemetry_2.png" alt="Telemetry 2" width="200" />
  <img src="assets/screenshots/telemetry_3.png" alt="Telemetry 3" width="200" />
  <img src="assets/screenshots/telemetry_4.png" alt="Telemetry 4" width="200" />
  <img src="assets/screenshots/telemetry_5.png" alt="Telemetry 5" width="200" />
  <img src="assets/screenshots/telemetry_6.png" alt="Telemetry 6" width="200" />
  <img src="assets/screenshots/telemetry_7.png" alt="Telemetry 7" width="200" />
  <img src="assets/screenshots/vision_1.png" alt="Vision 1" width="200" />
  <img src="assets/screenshots/vision_2.png" alt="Vision 2" width="200" />
  <img src="assets/screenshots/visison_3.png" alt="Vision 3" width="200" />
  <img src="assets/screenshots/visison_4.png" alt="Vision 4" width="200" />
  <img src="assets/screenshots/visison_5.png" alt="Vision 5" width="200" />
  <img src="assets/screenshots/voice.png" alt="Voice 1" width="200" />
  <img src="assets/screenshots/voice_2.png" alt="Voice 2" width="200" />
  <img src="assets/screenshots/voice_3.png" alt="Voice 3" width="200" />
  <img src="assets/screenshots/voice_4.png" alt="Voice 4" width="200" />
  <img src="assets/screenshots/voice_5.png" alt="Voice 5" width="200" />
  <img src="assets/screenshots/voice_6.png" alt="Voice 6" width="200" />
  <img src="assets/screenshots/voice_7.png" alt="Voice 7" width="200" />
</div>
##  Features

###  Real-Time Telemetry (Simulated)

* Live telemetry stream (battery, mode, connection state)
* Continuous updates using Dart streams
* Proper handling of loading, error, and empty states

---

###  Robot Command System

* Manual command execution via UI
* Directional movement controls
* Simulated real-world behavior:

  * Random network delay (200–1500 ms)
  * Timeout handling
  * 20% failure rate to mimic instability

This allows **realistic testing** of error handling and user feedback.

---

###  Voice-Controlled Robot Commands

* Real microphone input
* Supports **Arabic & English**
* Spoken commands are parsed and mapped to **domain-level robot commands**
* Fully integrated into the same command execution pipeline

> The design allows future replacement with advanced NLP or AI-based parsing.

---

###  Real-Time Vision (Camera + ML Kit)

* Uses the device camera for live object detection
* Powered by **Google ML Kit – Object Detection**
* Runs fully **on-device** (No backend, No cloud AI)
* Supports:

  * Multiple object detection
  * Confidence-based filtering
  * Correct camera rotation handling

This module demonstrates a **production-grade computer vision pipeline**.

---

###  Dark & Light Theme

* Supports Dark Mode & Light Mode
* Controlled via `ThemeCubit`
* User preference persisted using `SharedPreferences`
* Theme restored automatically on app restart

---

###  Localization (Arabic & English)

* Runtime language switching
* Implemented using **Flutter l10n** and `.arb` files
* Selected language persisted using `SharedPreferences`
* Language restored automatically on app launch

---

##  How to Run the Project

### Prerequisites

* Flutter SDK (latest stable)
* Android Studio or VS Code
* Android emulator or real device

### Android Configuration

```gradle
compileSdk = 35
targetSdk  = 35
```

Using the latest SDK versions ensures:

* Compatibility with modern Android APIs
* Better performance & security
* Future-proofing

### Run Commands

```bash
flutter clean
flutter pub get
flutter gen-l10n --arb-dir=lib/core/l10n --template-arb-file=app_en.arb --output-localization-file=app_localizations.dart --output-class=AppLocalizations
flutter run
```

> **Note**: For camera and voice features, using a real Android device is recommended.

---

##  State Management

RoboDash uses **Cubit (Bloc)** for state management.

### Why Cubit?

* Clear separation between UI and business logic
* Predictable state transitions
* Lightweight and easy to test
* Scales well with complex features

Each feature has its **own Cubit**, keeping responsibilities isolated and the UI declarative.

---

##  Architecture

The project follows **Clean Architecture** principles with strict separation of concerns.

### Project Structure

```text
lib/
 ├── app/            # App bootstrap, routing, global cubits
 ├── core/           # Themes, localization, DI, utilities
 ├── data/           # Data sources, models, repository implementations
 ├── domain/         # Entities, repository contracts, use cases
 └── presentation/   # UI features, cubits, widgets
```

### Layer Responsibilities

#### Presentation Layer

* Feature-based UI modules
* Cubit for state management
* No business logic inside widgets

#### Domain Layer

* Pure Dart (framework-independent)
* Entities, repository contracts, use cases
* Completely isolated from Flutter & plugins

#### Data Layer

* Repository implementations
* Fake telemetry & command data sources
* ML Kit vision integration
* Easily replaceable with real APIs or hardware

---

##  Dependency Injection

* Centralized service locator
* Separate DI setup for:

  * Data
  * Domain
  * Presentation

Promotes **loose coupling** and **high testability**.

---

##  Testing

### Current Coverage

```text
test/
 └── features/
     └── control/
         ├── cubit/
         └── widgets/
```

* Cubit unit tests for command logic
* Widget tests for control buttons and directional input

### Future Testing & Improvements

* Increase unit test coverage across all Cubits
* Add integration tests for full user flows
* Introduce golden tests for UI consistency
* Performance profiling for camera frame processing
* Optimize rebuilds and state granularity
* Improve voice command NLP mapping
* Add retry strategies for failed commands
* CI pipeline for automated testing

---

##  Performance Considerations

* Stream-based data handling
* On-device vision processing
* Feature-scoped Cubits to minimize rebuilds
* Lightweight and responsive UI components

The architecture allows future performance optimizations **without major refactoring**.

---


##  Future Extensions

The system is fully prepared for:

* Real backend integration (REST / WebSocket)
* Real robot hardware controllers
* Cloud or on-device AI models
* Advanced NLP for voice commands

---


##  Developed By

**Khaled Abubakr**
Flutter Developer 
