export def single [$name, $profile] {
  let output = $name | split row '.' | get 0
  let profiles = ["av1", "mov", "mp4"]
  if ("exports" | path exists) == false {
    mkdir "exports"
  }
  if (($profiles | where ($it == $profile) | length) == 1) {
    if ($profile == "av1") {
      ffmpeg -i $name -c:v libsvtav1 -crf 20 -preset 5 -c:a libopus -b:a 192K $"exports/($output).webm"
      ["Ok mkv"]
    } else if ($profile == "mov") {
      ffmpeg -i $name -c:v dnxhd -profile:v dnxhr_hqx -vf format=yuv422p10le -c:a copy $"exports/($output).mov"
    } else if ($profile == "mp4") {
      ffmpeg -i $name -c:v libx264 -vf format=yuv422p -preset slow -crf 20 -c:a aac -b:a 192K $"exports/($output).mp4"
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
