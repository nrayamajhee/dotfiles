#!/usr/bin/env nu

def main [config: string] {
  if $config == 'nvim' {
    cp nvim/init.lua ~/.config/nvim/init.lua
    cp -r nvim/lua ~/.config/nvim/
    # Packer can't run headless yet
    # nvim +PackerInstall +qall
  }
}
