def video [$name, $profile] {
  let output = $name | split row '.' | get 0
  let profiles = ["av1", "mp4"]
  if ("exports" | path exists) == false {
    mkdir "exports"
  }
  if (($profiles | where ($it == $profile) | length) == 1) {
    if ($profile == "av1") {
      ffmpeg -i $name -c:v libsvtav1 -preset 8 -pix_fmt yuv420p10le -crf 23 -c:a aac -b:a 192k $"exports/($output).webm"
      ["Ok av1"]
    } else if ($profile == "mp4") {
      ffmpeg -i $name -c:v libx264 -preset slow -crf 19 -c:a aac -b:a 192k $"exports/($output).mp4"
      ["Ok mp4"]
    } else {
      ["Internal error"]
    }
  } else {
    $"User error ($profile) invalid!\nSupported formats: ($profiles)"
  }
}
