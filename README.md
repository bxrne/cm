# 📦 cm — Fancy Conventional Commit Helper

A small shell script that helps you write [Conventional Commits](https://www.conventionalcommits.org/) with a friendly TUI using [gum](https://github.com/charmbracelet/gum).

---

## ✨ Features
- Choose commit type (`feat`, `fix`, `docs`, etc.)
- Optional scope (`(server)`, `(api)`, etc.)
- Guided summary and description prompts
- Final review and confirmation before committing

---

## 🚀 Install

Run this in your terminal:

```sh
sudo curl -fsSL 'https://raw.githubusercontent.com/bxrne/cm/c61b62e7ee49ec25d5ad72a82be0e0258de62b78/cm.sh' -o /usr/local/bin/cm
sudo chmod +x /usr/local/bin/cm
```

```sh
export PATH="$HOME/.local/bin:$PATH"
```

# ⚡ Dependencies

- gum

Install with:

# Arch Linux

```sh 
sudo pacman -S gum
```

# macOS (Homebrew)

```
brew install gum
```

# 🛠 Usage

From inside a git repo:

```sh 
cm
``
