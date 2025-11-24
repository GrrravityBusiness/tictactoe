# 🎮 Tic Tac Toe
A tic tac toe app.
> A simple, fun, and modern Tic Tac Toe app built with Flutter!


## 🚀 Getting Started

First, you will need to open this project using the workspace (for android studio)

This project uses **Flutter** `3.38.3`. You have two ways to set it up:

### 1 - Git Checkout

Use git to checkout the required Flutter version:
```bash
git checkout 3.38.3
```

---

### 2 - ASDF (Flutter Version Manager)
This app uses [ASDF](https://asdf-vm.com/) for Flutter version pinning. It's awesome! 😎

#### 🛠️ ASDF Setup
After installing ASDF CLI, run:
```bash
# Add Flutter plugin
asdf plugin add flutter
# Install Flutter version
asdf install flutter 3.38.3-stable
```
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

---

## 🔐 Environment Variables
For local development, use a `.env` JSON file for environment variables. These should be secured and injected via CI/CD in production.
- Example file: `.env.example.json` (provided)
- Create your own:
    - `.env.dev.json`
    - `.env.prod.json`
Use the structure from `.env.example.json` as a template.

---



## 📁 Project Structure


