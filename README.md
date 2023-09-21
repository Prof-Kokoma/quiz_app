# Quiz App README

## Introduction

Welcome to the README for the Quiz App! This app is designed to provide users with an interactive quiz experience. It fetches quiz questions from an API, displays them to the user, and shows indicators for correct and incorrect answers. The app uses a combination of powerful Flutter packages, including `hooks_river_pod`, `hook`, `enum_to_string`, `shared_preferences`, and `dio` for state management, enum conversion, data persistence, and network requests.

## Features

- Fetch quiz questions from a remote API.
- Display quiz questions to the user.
- Indicate correct and incorrect answers.
- Cache user progress and state for a seamless experience.

## Getting Started

## UIs

- ![screenshot1](<Simulator Screenshot - iPhone 14 Pro - 2023-09-21 at 07.06.38.png>)

### Prerequisites

Before you begin, ensure you have the following installed on your development machine:

- [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/)
- Emulator or physical device for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Prof-Kokoma/quiz_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd quiz-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

### Configuration

### Usage

1. Run the app:

   ```bash
   flutter run
   ```

2. Explore the quiz questions, select answers, and observe the indicators for correct and incorrect answers.

## State Management

- The app uses `hooks_river_pod` and `hook` for efficient state management. You can find state-related code in the `lib/providers` directory.

## Data Persistence

- User progress and state are persisted using `flutter_shared_preferences`. Relevant code can be found in the `lib/services` directory.

## Network Requests

- `dio` is used for making network requests to fetch quiz questions from the API. Look for API-related code in the `lib/services` directory.

## Retrieving User State

If you encounter issues with retrieving the user's current state, this part might need little improvement which I would still work on to fix and ensure it working perfectly.

## Contributing

We welcome contributions from the community! To contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Implement your changes.
4. Test your changes thoroughly.
5. Create a pull request with a clear title and description of your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions, feedback, or suggestions, please feel free to reach out to the project maintainer:

- Name: Oko-Osi Korede
- Email: okoosikorede@gmail.com
- GitHub: [Your GitHub Profile](https://github.com/Prof-Kokoma)

## Acknowledgments

I would like to acknowledge the open-source community and the developers behind the packages and tools used in this project.
