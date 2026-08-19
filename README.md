# ⚡ Git Bat - Simplified Git Workflow

A simple Windows batch script that simplifies a basic Git workflow.

**Git Bat** combines `git add .` and `git commit -m "message"` into a single command, with an optional push to the current branch.

The goal is not to replace Git or IDE interfaces, but to make a common terminal workflow a little faster and simpler.

## Features

- Add and commit all changes with a single command
- Optional push to `origin`
- Automatically detects the current branch
- Supports short and long options
- Basic argument validation
- Preserves Git's original output and errors
- Simple installer that adds Git Bat to the user's `PATH`

## Requirements

- Windows
- Git installed and available in the terminal
- Windows PowerShell

**Git Bat** itself is implemented as a `.bat` script.

PowerShell is only used by the installer to safely manage the user's `PATH`.

## Installation

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

## Usage

### Commit changes

```bash
gitbat -m "your commit message"
```

or:

```bash
gitbat --message "your commit message"
```

This runs:

```bash
git add .
git commit -m "your commit message"
```

### Commit and push

```bash
gitbat -m "your commit message" --push
```

or:

```bash
gitbat --message "your commit message" --push
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

## Options

| Option                                  | Description                            |
| --------------------------------------- | -------------------------------------- |
| `-m "message"` or `--message "message"` | Define the commit message              |
| `--push`                                | Push to `origin` on the current branch |
| `-h` or `--help`                        | Show the help message                  |

## Examples

```bash
gitbat -m "add login page"
```

```bash
gitbat -m "fix navigation bug" --push
```

```bash
gitbat --help
```

## How It Works

Without **Git Bat**:

```bash
git add .
git commit -m "your message"
git push origin main
```

With **Git Bat**:

```bash
gitbat -m "your message" --push
```

**Git Bat** handles the repetitive parts while Git performs the actual operations.

## Important Notes

### Staging

**Git Bat** currently uses:

```bash
git add .
```

All changes in the repository are staged before the commit.

### No Changes

If there are no changes to commit, Git's original message is displayed:

```text
nothing to commit, working tree clean
```

### Push

The `--push` option uses:

```bash
git push origin <current-branch>
```

The current branch is detected automatically.

## Project Structure

```text
git-bat/
│
├── gitbat.bat      # Main Git Bat script
├── install.bat     # Adds Git Bat to the user's PATH
├── README.md       # English documentation
├── README-pt-BR.md # Portuguese documentation
├── .gitignore      # Git ignore rules
└── LICENSE         # MIT License
```

## Why BAT?

**Git Bat** was created as a Windows batch script to keep the tool simple to run and distribute without requiring an additional runtime.

## Limitations

- Windows only
- Uses `git add .`
- No graphical interface
- No automatic conflict resolution
- No built-in uninstall script

## Contributing

Suggestions, bug reports and improvements are welcome. If you find a problem, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

See the [LICENSE](LICENSE) file for more information.
