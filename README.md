
# Flutter Application

This repository contains a Flutter app that you can run on your local machine. Follow the instructions below to set up the necessary tools and run the app.

## Tools Required

1. **Flutter**

Ensure Flutter is installed on your system.

Check if Flutter is installed by running:

```bash
flutter --version
```

If not installed, follow the [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).

2. **Android Studio/Visual Studio Code**

Use either Android Studio or Visual Studio Code as your IDE. Both support Flutter development.

- [Install Android Studio](https://developer.android.com/studio)
- [Install Visual Studio Code](https://code.visualstudio.com/)

3. **Xcode (macOS only, for iOS development)**

If you plan to run the app on an iOS device, install Xcode:

- [Install Xcode](https://developer.apple.com/xcode/)

## How to Run the App

Follow these steps to run the app on your local machine:

1. **Clone the Repository**

Ensure Git is installed by running:

```bash
git --version
```

Clone the repository:

- Click the green Code button at the top-right of this repository.
- Copy the repository URL.

Open Terminal (or Command Prompt), navigate to the desired folder, and run:

```bash
git clone https://github.com/12narendra45/flutter-application
```

2. **Install Dependencies**

Navigate to the project folder:

```bash
cd flutter-application
```

Run the following command to install all required dependencies:

```bash
flutter pub get
```

3. **Run the App**

For Android:

Ensure you have an Android emulator running, then execute:

```bash
flutter run
```

For iOS (macOS only):

Ensure Xcode is installed, then execute:

```bash
flutter run
```

## Project Information

### Main Project Files

The project contains the following key files:

- `main.dart`: Entry point of the Flutter application.
- `providers.dart`: Handles state management and dependencies.
- `widgets.dart`: Includes custom widgets for UI elements like shimmer effects and search highlights.
- `data_fetching_data.dart`: Contains UI-related tasks and data-fetching logic.

### Dependencies Used

The app uses the following dependencies:

- **Riverpod**: For state management.
- **Shimmer**: For shimmer effects in the UI.

## Additional Information

If you encounter any issues, consult the [Flutter Documentation](https://flutter.dev/docs).

Feel free to open an issue in this repository if you need further assistance.
