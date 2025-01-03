# dotfiles

A collection of configurations for my arch linux/mac setup.

Programs: 

- [Nushell (Default shell)](https://www.nushell.sh)
- [Alacritty (Terminal Emulator)](https://alacritty.org/)
- [Tmux (Terminal Multiplexer)](https://en.wikipedia.org/wiki/Tmux)
- [NeoVim (Text Editor)](https://neovim.io/)
- [Starship (Shell Prompt)](https://starship.rs/)
- [Bat (cat replacement)](https://github.com/sharkdp/bat)
- [Rg (grep replacement)](https://github.com/BurntSushi/ripgrep)

Color Scheme:

- [Ayu Dark](https://github.com/ayu-theme/ayu-vim)

Fonts: 

- [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro)
- [Noto Sans](https://fonts.google.com/noto/specimen/Noto+Sans?query=Noto+Sans)
- [Inconsolata](https://levien.com/type/myfonts/inconsolata.html)

This repository also contains keyboard configuration for my 2 Lily58s (QMK and ZMK) and git config.

The install script automates package installations and configurations copy-pasting:

```
❯ use setup.nu
❯ setup [ git | font | alacritty | shell | nvim | everything]"
```
