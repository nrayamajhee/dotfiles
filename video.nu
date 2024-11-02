export def single [$name, $profile] {
  let output = $name | split row '.' | get 0
  let profiles = ["av1", "mov", "mp4"]
  if ("exports" | path exists) == false {
    mkdir "exports"
  }
  if (($profiles | where ($it == $profile) | length) == 1) {
    if ($profile == "av1") {
      ffmpeg -i $name -c:v libsvtav1 -v:b 100M -preset 5 -pix_fmt yuv420p10le -c:a copy $"exports/($output).mkv"
      ["Ok mkv"]
    } else if ($profile == "mov") {
      ffmpeg -i $name -c:v dnxhd -profile:v dnxhr_hqx -vf format=yuv420p10le -c:a copy $"exports/($output).mov"
    } else if ($profile == "mp4") {
      ffmpeg -i $name -c:v libx265 -vf format=yuv420p10le -preset slow -crf 20 -c:a copy $"exports/($output).mp4"
      ["Ok mov"]
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
