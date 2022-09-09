#!/usr/bin/env nu

def main [config: string] {
  if $config == 'nvim' {
    cp init.lua ~/.config/nvim/init.lua
    cp -r lua ~/.config/nvim/
    # Packer can't run headless yet
    # nvim +PackerInstall +qall
  }
}
