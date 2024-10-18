export def single [$name, $profile] {
  let output = $name | split row '.' | get 0
  let profiles = ["av1", "mov"]
  if ("exports" | path exists) == false {
    mkdir "exports"
  }
  if (($profiles | where ($it == $profile) | length) == 1) {
    if ($profile == "av1") {
      ffmpeg -i $name -c:v libsvtav1 -preset 6 -crf 23 -vf format=yuv422p10le -c:a opus -b:a 160k -strict -2 $"exports/($output).webm"
      ["Ok av1"]
    } else if ($profile == "mov") {
      ffmpeg -i $name -c:v dnxhd -profile:v dnxhr_hqx -vf format=yuv422p10le -c:a copy $"exports/($output).mov"
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
