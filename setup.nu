def isLinux [] { sys  host | get long_os_version | str contains "Linux" }
def isMac [] { sys  host | get long_os_version | str contains "MacOS" }

def if_unavail [packages: list] {
  $packages | each { |it|
    if (isLinux) {
      let pkg_missing = (pacman -Qsq $it | is-empty)
      if $pkg_missing {
        echo $"No ($it) found! Installing it"
        paru -S --noconfirm $it
      }
    }
    if (isMac) {
      let pkg_missing = (brew list | grep $it | is-empty)
      if $pkg_missing {
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


export def git [] {
  cp gitconfig ~/.gitconfig
}

export def font [] {
  if (isLinux) {
    create_dir_if_unavil ~/.config/fontconfig
    cp fonts.conf ~/.config/fontconfig/
  } else {
    echo "You're on mac! fontconfig has no effect."
  }
} 

export def alacritty [] { 
    cp tmux.conf ~/.tmux.conf
    create_dir_if_unavil ~/.config/alacritty
    if (isLinux) {
      cp alacritty.toml ~/.config/alacritty/
    } else {
      cp alacritty_mac.toml ~/.config/alacritty/
    }
}

export def shell [] {
    let env_file = ("./env.nu" | path expand)
    open $nu.env-path | lines | append $"source ($env_file)"  | save $nu.env-path -f
}

export def nvim [] {
  ln -s ("./nvim" | path expand) ~/.config/nvim
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
  git
  font
  alacritty
  shell
  nvim
}

# Setup neovim
export def main [] {
$"use setup.nu
setup [ alacritty | font | nvim | shell | everything]"
}
