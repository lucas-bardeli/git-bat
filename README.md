# ⚡ Git Bat - Simplified Git Workflow

A simple Windows batch script that simplifies a basic Git workflow.

GitBat combines `git add .` and `git commit -m "message"` into a single command, with an optional push to the current branch.

The goal is not to replace Git or IDE interfaces, but to make a common terminal workflow a little faster and simpler.

## Features

- Add and commit all changes with a single command
- Optional push to `origin`
- Automatically detects the current Git branch
- Supports short and long command options
- Basic argument validation
- Displays Git's original output and errors
- Custom error messages for common situations
- Simple Windows installer
- Adds GitBat to the user's `PATH`
- Can be installed by double-clicking `install.bat`

## Requirements

- Windows
- Git installed and available in the terminal
- Windows PowerShell

GitBat itself is implemented as a `.bat` script.

PowerShell is only used by the installer to safely manage the user's `PATH`.

## Installation

Clone or download the repository:

```bash
git clone https://github.com/lucas-bardeli/git-bat.git
```

Enter the project directory:

```powershell
cd git-bat
```

### Option 1 — Double-click

Open the project folder and double-click:

```text
install.bat
```

The installer will:

1. Check if `gitbat.bat` exists.
2. Check the current user's `PATH`.
3. Add the GitBat directory if it is not already there.
4. Avoid adding duplicate entries.
5. Display the installation result.

### Option 2 — Terminal

You can also run the installer from PowerShell or Command Prompt:

```powershell
.\install.bat
```

After installation, close the current terminal and open a new one.

Then verify the installation:

```powershell
gitbat --help
```

If the help message is displayed, GitBat is ready to use.

## Usage

GitBat requires a commit message.

### Commit changes

```bash
gitbat -m "your commit message"
```

or:

```bash
gitbat --message "your commit message"
```

GitBat will execute:

```bash
git add .
git commit -m "your commit message"
```

### Commit and push

To commit the changes and push them to the current branch:

```bash
gitbat -m "your commit message" --push
```

or:

```bash
gitbat --message "your commit message" --push
```

When `--push` is used, GitBat automatically detects the current branch and executes:

```bash
git push origin <current-branch>
```

For example, if the current branch is `feature/login`, GitBat will execute:

```bash
git push origin feature/login
```

This also works for the first push of a branch.

## Options

| Option                | Description                            |
| --------------------- | -------------------------------------- |
| `-m "message"`        | Define the commit message              |
| `--message "message"` | Define the commit message              |
| `--push`              | Push to `origin` on the current branch |
| `-h`                  | Show the help message                  |
| `--help`              | Show the help message                  |

## Examples

Basic commit:

```bash
gitbat -m "add login page"
```

Commit and push:

```bash
gitbat -m "fix navigation bug" --push
```

Using the long option:

```bash
gitbat --message "update documentation" --push
```

Show help:

```bash
gitbat --help
```

## How it works

Without GitBat, a basic workflow can look like this:

```bash
git add .
git commit -m "your message"
git push origin main
```

With GitBat:

```bash
gitbat -m "your message" --push
```

GitBat handles the repetitive parts while still relying on Git itself to perform the actual operations.

The simplified workflow is:

```text
GitBat
   |
   +-- Validate arguments
   |
   +-- Check Git repository
   |
   +-- git add .
   |
   +-- git commit -m "message"
   |
   +-- [optional] detect current branch
   |
   +-- [optional] git push origin <branch>
```

## Error Handling

GitBat does not hide Git's output.

Git errors and warnings are displayed normally, while GitBat also provides additional messages for common situations.

For example, running GitBat outside a Git repository will display:

```text
[GitBat] Error: this directory is not a Git repository.
```

Running it without a commit message will display an appropriate error instead of attempting the commit.

If Git itself reports an error, its original output is preserved so the user can see what happened.

## Important Notes

### `git add .`

GitBat currently stages all changes in the current repository using:

```bash
git add .
```

This means GitBat is intended for users who are comfortable committing all current changes.

If you need to stage specific files individually, using Git directly or the staging interface in an IDE may be more appropriate.

### Commit with no changes

If there are no changes to commit, Git will report:

```text
nothing to commit, working tree clean
```

GitBat detects that the commit was not created and reports the failure.

### Push

The `--push` option always uses:

```bash
git push origin <current-branch>
```

The current branch is detected automatically.

## Project Structure

```text
git-bat/
│
├── gitbat.bat
├── install.bat
├── README.md
├── README-pt-BR.md
├── .gitignore
└── LICENSE
```

### `gitbat.bat`

The main GitBat script. It handles arguments, validation, commits and optional pushes.

### `install.bat`

Installs GitBat by adding the project directory to the current user's `PATH`.

### `README.md`

English documentation.

### `README-pt-BR.md`

Portuguese documentation.

### `.gitignore`

Contains Windows-related ignore rules to help avoid accidentally committing unnecessary or sensitive local files.

## Why BAT?

GitBat was intentionally created as a Windows batch script.

The idea was to make the tool extremely simple to run and distribute without requiring a separate application or runtime.

The installer uses Windows PowerShell only where it makes sense: managing the user's `PATH`.

## Current Limitations

GitBat is intentionally small and currently has some limitations:

- Windows only
- Uses `git add .`, so individual file selection is not supported
- Arguments are expected in the documented format
- No graphical interface
- No automatic conflict resolution
- No built-in uninstall script yet

These limitations may change in future versions.

## Contributing

Suggestions, bug reports and improvements are welcome.

If you find a problem, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

See the `LICENSE` file for more information.
