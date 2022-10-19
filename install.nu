#!/usr/bin/env nu

def install_if_unavail [packages] {
  $packages | each { |it|
    let has_pkg = (pacman -Qsq $it)
    if $has_pkg == '' {
      echo $"No ($it) found! Installing it"
      paru -S --noconfirm $it
    }
  }
}

def create_dir_if_unavil [dir: string] {
  if ($dir | path exists) == false {
    let path = ($dir | path expand)
    mkdir $path
  }
}

def check_base [] {
  let has_git = (pacman -Qsq git)
  if $has_git == '' {
    echo "Git not found! Installing it"
    sudo pacman -S --noconfirm --needed base-devel git
  }
}

def match [var: string, arg: string] {
  $var == $arg || $var == ($arg | split chars | get 0) || $var == 'yolo' || $var == 'y'
}

def check_paru [] {
  let has_paru = (pacman -Qsq paru)
  if $has_paru == '' {
    echo "No paru found! Installing it"
    cd ~/Downloads
    git clone https://aur.archlinux.org/paru-bin
    if ("./paru-bin" | path exists) {
      rm -r paru-bin
      mkdir paru-bin
    }
    cd paru--bin
    makepkg -sri --noconfirm
  }
}

def main [config?] {
  check_base
  check_paru
  install_if_unavail [alacritty neovim nvim-packer-git alacritty tmux ttf-crimson-pro ttf nerd-fonts-inconsolata noto-fonts noto-fonts-emoji starship bat ripgrep]
  if (match $config 'nvim') {
    cp -r nvim ~/.config/
    # Packer can't run headless yet
    # nvim +PackerInstall +qall
  }
  if (match $config 'alacritty') {
    cp tmux.conf ~/.tmux.conf
    create_dir_if_unavil ~/.config/alacritty
    cp alacritty.yml ~/.config/alacritty/
  }
  if (match $config 'git') {
    cp gitconfig ~/.gitconfig
  }
  if (match $config 'font') {
    create_dir_if_unavil ~/.config/fontconfig
    cp fonts.conf ~/.config/fontconfig/
  }
  if (match $config 'nushell') {
    let nu_file = ("~/.config/nushell/env.nu" | path expand)
    let env_file = ("./env.nu" | path expand)
    open $nu_file | lines | append $"source ($env_file)"  | save $nu_file
  }
  if $config == null {
    echo 'install.nu (n)vim | (a)lacritty | (g)it | (f)ont | (n)ushell | (y)olo'
  }
}
