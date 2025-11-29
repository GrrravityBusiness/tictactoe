# 🎮 Tic Tac Toe
A simple, fun, and modern Tic Tac Toe app built with Flutter!

Find a friend and play together ! 

---

## 📑 Table of Contents

- [🎮 Tic Tac Toe](#-tic-tac-toe)
  - [📑 Table of Contents](#-table-of-contents)
  - [📁 Project Structure](#-project-structure)
    - [Project Diagram](#project-diagram)
- [🚀 Getting Started](#-getting-started)
  - [Setup your environment](#setup-your-environment)
    - [Option 1 - Git Checkout](#option-1---git-checkout)
    - [Option 2 - ASDF (Flutter Version Manager)](#option-2---asdf-flutter-version-manager)
      - [🛠️ ASDF Setup](#️-asdf-setup)
      - [⚙️ Terminal Configuration](#️-terminal-configuration)
      - [🖥️ VSCode Configuration](#️-vscode-configuration)
      - [🧑‍💻 Android Studio Configuration](#-android-studio-configuration)
  - [🔐 Environment Variables](#-environment-variables)
  - [⚡️ Run the project](#️-run-the-project)
- [🗃️ Dependencies](#️-dependencies)

---

## 📁 Project Structure

This project apply clean architecture (which is greatly explained by [reso coder](https://resocoder.com/flutter-clean-architecture-tdd/)) and [feature-first folder structure ](https://codewithandrea.com/articles/flutter-project-structure/).

- **Clean Architecture :** It's a really great practice to help developpers applying some of basic SOLID principles seamlessly as well as making scallable and agnostics apps.
  
- **Feature first structure :** This is more debatable folder organisation as it may lead to duplicating some layers. But it can really help alot to avoid unexpected side effect when adding or modifying features.

### Project Diagram

Project Structure (Markdown Tree):

```
root/
├── assets/
│   └── fonts/
├── lib/
│   ├── main.dart
│   ├── 1-features/
│   │   ├── 0-onboarding/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── 1-lobby/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── 3-game/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   ├── core/
│   │   ├── localization/
│   │   ├── router/
│   │   ├── services/
│   │   ├── services/
│   │   └── widgets/
│   └── main.dart
├── test/
│   ├── 0-onboarding/
│   ├── 1-lobby/
│   ├── 3-game/
│   └── utils/
├── pubspec.yaml
├── analysis_options.yaml
├── .env.*.json
```

---


# 🚀 Getting Started

First, you will need to open this project using the workspace (for VSCode)

This project uses **Flutter** `3.38.3`. You have two ways to set it up:

## Setup your environment

### Option 1 - Git Checkout

Use git to checkout the required Flutter version:
```bash
git checkout 3.38.3
```

>You might need to change paths setup i commited in those files :
>
>  - [tictactoe.code-workspace](./tictactoe.code-workspace) : edit or remove the parameter `dart.flutterSdkPath`
>
>  - [local.properties](./android/local.properties) : edit `flutter.sdk` to set your own path

---

### Option 2 - ASDF (Flutter Version Manager)
This app's workspace uses [ASDF](https://asdf-vm.com/) for Flutter version pinning. It's awesome! 😎

#### 🛠️ ASDF Setup
After installing ASDF CLI, run:
```bash
# Add Flutter plugin
asdf plugin add flutter
# Install Flutter version
asdf install flutter 3.38.3-stable
```
---
> **iOS Specific:**
> To build for iOS on macOS, you also need Ruby:
> ```bash
> # Add Ruby plugin
> asdf plugin add ruby
> # Install Ruby version
> asdf install ruby 3.2.2
> ```

#### ⚙️ Terminal Configuration
Using `.tool-version` in the project directory, your terminal will auto-select the right Flutter version. To change it:
```bash
asdf set flutter XX.XX.XX-stable
```

#### 🖥️ VSCode Configuration
Open the project as a workspace with `tictactoe.code-workspace`. Edit the Flutter SDK path:
```jsonc
{
    // ...
    "dart.flutterSdkPath": "/Users/<YourUserName>/.asdf/installs/flutter/3.38.3-stable",
    // ...
}
```

#### 🧑‍💻 Android Studio Configuration
Go to `Settings > Language & Frameworks > Flutter > Flutter SDK Path:` and set it as : `/Users/<YourUserName>/.asdf/installs/flutter/3.38.3-stable`

> 💡 Alternatively, use [FVM](https://fvm.app/), a Docker container, or simply checkout the required Flutter version with git.

---


## 🔐 Environment Variables
For local development, use a `.env` JSON file for environment variables. These should be secured and injected via CI/CD in production.
- Example file: `.env.example.json` ([provided here](./.env.example.json))
- Create your own:
    - `.env.dev.json`
    - `.env.prod.json`
Use the structure from `.env.example.json` as a template.


## ⚡️ Run the project

2. Run flutter command in dev
```bash
flutter run --dart-define-from-file=./.env.dev.json
```

2. Run flutter command in prod
```bash
flutter run --dart-define-from-file=./.env.prod.json
```



# 🗃️ Dependencies
Ce projet contient plusieurs dépendances dont les majeurs sont énumérés ici :

|Dependency|Usage|
|---	|---	|
|**bloc**|State management library which provide great flexibility over state changes as well as built-in UI builders and listeners|
|**get_it**|Service locator for easy injections using singletons (or factory)|
|**dartz**|Functional programming library mainly used for `Either` monad to handle errors|
|**go_router**|Navigation library with deep linking, path and query parameters...|
|**freezed**|Great library for immutable data classes with deep equality and utilities like `copyWith()`|
|**shared_preference**|Well known library to store non sensitive data locally|