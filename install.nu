#!/usr/bin/env nu

let isLinux = sys | get host | get long_os_version | str contains "Linux"
let isMac = sys | get host | get long_os_version | str contains "MacOS"

def install_if_unavail [packages] {
  $packages | each { |it|
    if $isLinux {
      let has_pkg = (pacman -Qsq $it) == ''
      if $has_pkg {
        echo $"No ($it) found! Installing it"
        paru -S --noconfirm $it
      }
    }
    if $isMac {
      let has_p = /home/linuxbrew/.linuxbrew/bin/brew list
      let has_pkg = ($has_p | grep $it) == ''
      if $has_pkg {
        echo $"No ($it) found! Installing it"
        if $it == "alacritty" {
          brew install --cask $it
        } else {
          brew install $it 
        }
      }
    }
  }
}

def create_dir_if_unavil [dir: string] {
  if ($dir | path exists) == false {
    let path = ($dir | path expand)
    mkdir $path
  }
}


def check_pacman [] {
  if $isLinux {
    if (which paru | get path | length) == 0 {
      echo "No paru found! Installing it"
      cd ~/Downloads
      if ("./paru-bin" | path exists) {
        rm -r paru-bin
      }
      git clone "https://aur.archlinux.org/paru-bin"
      cd paru-bin
      makepkg -sri --noconfirm
    }
  }
  if $isMac {
    if (which brew | get path | length) == 0 {
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }
  }
}


def setup_shell [] {
    let nu_file = ("~/.config/nushell/env.nu" | path expand)
    let env_file = ("./env.nu" | path expand)
    open $nu_file | lines | append $"source ($env_file)"  | save $nu_file -f
}

def setup_git [] {
  cp gitconfig ~/.gitconfig
}

def setup_font [] {
  create_dir_if_unavil ~/.config/fontconfig
  cp fonts.conf ~/.config/fontconfig/
} 

def setup_nvim [] {
  ln -s (pwd | str trim | append "nvim" | str join "/") ~/.config/nvim
  # Packer can't run headless yet
  # nvim +PackerInstall +qall
}

def setup_alacritty [] { 
    cp tmux.conf ~/.tmux.conf
    create_dir_if_unavil ~/.config/alacritty
    cp alacritty.toml ~/.config/alacritty/
}

def init [] {
  check_pacman
  install_if_unavail [alacritty neovim tmux starship bat ripgrep]
  if $isLinux {
    install_if_unavail [ttf-crimson-pro ttf-inconsolata-nerd noto-fonts noto-fonts-emoji]
  }
}

def setup_everything [] {
  init
  setup_nvim
  setup_alacritty
  setup_git
  setup_font
  setup_shell
}

# Setup neovim
def "main neovim" [] {  setup_nvim }
def "main n" [] {  setup_nvim }

# Setup alacritty
def "main alacritty" [] {  setup_alacritty }
def "main a" [] {  setup_alacritty }

# Install packages
def "main install" [] { init }
def "main i" [] { setup_init }

# Setup git
def "main git" [] { setup_git }
def "main g" [] { setup_git }

# Setup font
def "main font" [] { setup_font }
def "main f" [] { setup_font }

# Setup shell
def "main shell" [] { setup_shell }
def "main s" [] { setup_shell }

# Setup shell
def "main everything" [] { setup_everything }
def "main e" [] { setup_everything }

def main [] {
  echo  'install.nu (a)lacritty | (f)ont | (g)it | (i)install | (n)eovim | (s)shell | (e)verything'
  echo 'See install.nu --help'
}
