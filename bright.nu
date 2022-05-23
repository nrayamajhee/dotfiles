#!/usr/bin/env nu

def disp [color: string text: string] {
  $"(ansi $color)($text)(ansi white)"
}

def main [val?: string]  {
  if $val == "init" {
    if (ls /dev/ | find i2c | length) > 0 {
      disp green "Modules already Loaded"
    } else {
      disp yellow "Loading Modules"
      sudo modprobe i2c-dev
    }
    disp yellow Support
    sudo ddcutil capabilities | rg "Feature: 10"
    disp yellow Brightness
    sudo ddcutil getvcp 10 | rg "current value"
  } else if $val == "dawn" {
    sudo ddcutil setvcp -d 1 10 75
    sudo ddcutil setvcp -d 2 10 75
  } else if $val == "day" {
    sudo ddcutil setvcp -d 1 10 100
    sudo ddcutil setvcp -d 2 10 100
  } else if $val == "dusk" {
    sudo ddcutil setvcp -d 1 10 50
    sudo ddcutil setvcp -d 2 10 50
  } else if $val == "night" {
    sudo ddcutil setvcp -d 10 40
    sudo ddcutil setvcp -d 10 40
  } else if $val == "sleep" {
    sudo ddcutil setvcp -d 1 10 0
    sudo ddcutil setvcp -d 2 10 0
  } else {
    sudo ddcutil setvcp -d 1 10 ($val | into int)
    sudo ddcutil getvcp -d 1 10 | rg "current value"
    sudo ddcutil setvcp -d 2 10 ($val | into int)
    sudo ddcutil getvcp -d 2 10 | rg "current value"
  }
}
