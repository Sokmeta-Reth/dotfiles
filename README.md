# dotfiles

My macOS setup: zsh, Homebrew packages and app configs.

## Setup

```sh
git clone https://github.com/Sokmeta-Reth/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
./sync
```

Then restart the terminal and set its font to `MesloLGS NF`.

## Shell

zsh with [zinit](https://github.com/zdharma-continuum/zinit) as the plugin manager (installed by `zsh/install`). Plugins are listed in `zsh/plugins`:

- zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions
- fzf-tab for fuzzy completion
- Oh My Zsh snippets: git, docker-compose, command-not-found

Prompt is [Powerlevel10k](https://github.com/romkatv/powerlevel10k), config in `zsh/p10k-dark`.

## Commands

| Command     | What it does                                                                  |
| ----------- | ----------------------------------------------------------------------------- |
| `./install` | Installs Homebrew, everything in `homebrew/Brewfile`, then runs each `<topic>/install` |
| `./sync`    | Symlinks every file listed in `<topic>/links`. Existing files are moved to `~/.dotfiles-backup/` |
| `./dump`    | Writes installed Homebrew packages back to `homebrew/Brewfile`                |

All three are safe to re-run.

## Structure

Each folder is a topic. A topic can have any of these files:

| File       | Used by    | Purpose                                         |
| ---------- | ---------- | ----------------------------------------------- |
| `install`  | `./install` | One-time setup (clone a plugin, download fonts) |
| `links`    | `./sync`    | `<file> <destination>` per line                 |
| `path`     | zshrc      | PATH and environment variables                  |
| `alias`    | zshrc      | Aliases                                         |
| `function` | zshrc      | Shell functions                                 |

To add a new tool, create a folder for it and drop in whichever files it needs.
