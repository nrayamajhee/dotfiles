export def single [$name, $profile] {
  let output = $name | split row '.' | get 0
  let profiles = ["av1", "mp4"]
  if ("exports" | path exists) == false {
    mkdir "exports"
  }
  if (($profiles | where ($it == $profile) | length) == 1) {
    if ($profile == "av1") {
      ffmpeg -i $name -c:v libsvtav1 -preset 6 -b:v 100M -vf format=yuv420p10le -c:a copy $"exports/($output).mkv"
      ["Ok av1"]
    } else if ($profile == "mp4") {
      ffmpeg -i $name -c:v libx264 -preset slow -b:v 100M -vf format=yuv420p10le -c:a copy $"exports/($output).mp4"
      ["Ok mp4"]
    } else {
      ["Internal error"]
    }
  } else {
    $"User error ($profile) invalid!\nSupported formats: ($profiles)"
  }
}

export def batch [$dir, $profile] {
  ls $dir | where name =~ "MP4" | select name | each { |file|
    let name = $file | get "name"
    single $name $profile
  }
}
