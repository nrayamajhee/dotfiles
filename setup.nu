def isLinux [] { sys  host | get long_os_version | str contains "Linux" }
def isMac [] { sys  host | get long_os_version | str contains "MacOS" }

def if_unavail [packages] {
  $packages | each { |it|
    if (isLinux) {
      let has_pkg = (pacman -Qsq $it) == ''
      if $has_pkg {
        echo $"No ($it) found! Installing it"
        paru -S --noconfirm $it
      }
    }
    if (isMac) {
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
  if (isLinux) {
    if (which paru | get path | length) == 0 {
      echo "No paru found! Installing it"
      cd ~/Downloads
      if ("./paru-bin" | path exists) {
        rm -r paru-bin
      }
      # git clone "https://aur.archlinux.org/paru-bin"
      cd paru-bin
      makepkg -sri --noconfirm
    }
  }
  if (isMac) {
    if (which brew | get path | length) == 0 {
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }
  }
}


def shell [] {
    let nu_file = ("~/.config/nushell/env.nu" | path expand)
    let env_file = ("./env.nu" | path expand)
    open $nu_file | lines | append $"source ($env_file)"  | save $nu_file -f
}

export def git [] {
  cp gitconfig ~/.gitconfig
}

export def font [] {
  create_dir_if_unavil ~/.config/fontconfig
  cp fonts.conf ~/.config/fontconfig/
} 

export def nvim [] {
  if ("~/.config/nvim" | path exists) {
    rm ~/.config/nvim
  }
  ln -s (pwd | str trim | append "nvim" | str join "/") ~/.config/nvim
  # Packer can't run headless yet
  # nvim +PackerInstall +qall
}

export def alacritty [] { 
    cp tmux.conf ~/.tmux.conf
    create_dir_if_unavil ~/.config/alacritty
    cp alacritty.toml ~/.config/alacritty/
}

def init [] {
  check_pacman
  if_unavail [alacritty neovim tmux starship bat ripgrep]
  if (isLinux) {
    if_unavail [ttf-crimson-pro ttf-inconsolata-nerd noto-fonts noto-fonts-emoji]
  }
}

export def everything [] {
  init
  alacritty
  git
  font
  shell
  nvim
}

# Setup neovim
export def main [] {
  $"use install.nu
   [alacritty|font|nvim|shell]
   everything"
}
