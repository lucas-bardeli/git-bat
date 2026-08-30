# ⚡ Git Bat - Simplified Git Workflow

**Git Bat** is a lightweight Windows tool that combines `git add .` and `git commit -m "message"` into a single command, with an optional push to the current branch.

The goal is not to replace Git or IDE interfaces, but to make a common terminal workflow faster and more convenient.

## 💡 Features

- Add and commit all changes with a single command
- Optional push to `origin`
- Automatically detects the current branch
- Supports short and long options
- Basic argument validation
- Preserves Git's original output and errors
- Color-coded `[GitBat]` messages for information, errors and success
- Simple installer that adds **Git Bat** to the user's `PATH`

## ⚙️ Installation

Clone or download the repository:

```bash
git clone https://github.com/lucas-bardeli/git-bat.git
# Enter the project directory:
cd git-bat
```

Run the installer by double-clicking [install.bat](install.bat) or from a terminal:

```powershell
.\install.bat
```

After installation, open a new terminal and verify:

```powershell
gitbat --help
```

> To update an existing installation, pull the latest changes.

## 💻 Usage

### Commit changes

```bash
gitbat -m "your commit message"
```

or:

```bash
gitbat --message "your commit message"
```

### Commit and push

```bash
gitbat -m "your commit message" --push
```

With `--push`, **Git Bat** detects the current branch and runs:

```bash
git push origin <current-branch>
```

For example, if the current branch is `feature/login`, **Git Bat** will execute:

```bash
git push origin feature/login
```

This also works for the first push of a branch.

### Options

| Option                                  | Description                            |
| --------------------------------------- | -------------------------------------- |
| `-m "message"` or `--message "message"` | Define the commit message              |
| `--push`                                | Push to `origin` on the current branch |
| `-h` or `--help`                        | Show the help message                  |

**Git Bat** uses `git add .`, so all changes in the repository are staged before the commit.

If there are no changes, Git's original message is displayed:

> nothing to commit, working tree clean

**Git Bat** does not hide Git's output or errors.

## 📦 Requirements

- Windows
- Git installed and available in the terminal
- Windows PowerShell

**Git Bat** is implemented as a `.bat` script and does not require an additional runtime.

PowerShell is only used by the installer to safely manage the user's `PATH`.

**Git Bat** is intentionally focused on a small terminal workflow. It currently does not provide:

- Individual file staging
- A graphical interface
- Automatic conflict resolution
- A built-in uninstall script

## 🗂️ Project Structure

```text
git-bat/
├── gitbat.bat       # Main Git Bat script
├── install.bat      # Adds Git Bat to the user's PATH
├── README.md        # English documentation
├── README-pt-BR.md  # Portuguese documentation
├── .gitignore       # Git ignore rules for security
└── LICENSE          # MIT License
```

## 📑 Contributing and License

Suggestions, bug reports and improvements are welcome.
If you find a problem, feel free to open an issue or submit a pull request.
This project is licensed under the **MIT License**.
See the [LICENSE](LICENSE) file for more information.
