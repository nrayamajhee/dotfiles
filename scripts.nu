export def disp [color: string text: string] {
  $"(ansi $color)($text)(ansi white)"
}

export def bright [val?: string]  {
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
    sudo ddcutil setvcp 10 75
  } else if $val == "day" {
    sudo ddcutil setvcp 10 100
  } else if $val == "dusk" {
    sudo ddcutil setvcp 10 50
  } else if $val == "night" {
    sudo ddcutil setvcp 10 40
  } else if $val == "sleep" {
    sudo ddcutil setvcp 10 0
  } else {
    sudo ddcutil setvcp 10 ($val | into int)
    sudo ddcutil getvcp 10 | rg "current value"
  }
}

export def headfo []  {
  let ID = "CC:98:8B:B7:E7:1E"
  bluetoothctl connect $ID
  let PID = "$(echo bluez_output.$(echo $ID | sed -e 's/:/_/g').a2dp-sink)"
  echo $PID
  pactl set-default-sink $PID
}

