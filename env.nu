def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $"--status=($env.LAST_EXIT_CODE)"
}

$env.STARSHIP_SHELL = "nu"

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""

alias edit = nvim
alias suedit = sudo nvim
alias pac = paru
alias sysd = sudo systemctl
alias cat = bat -pp
alias rm = gio trash
alias checkout = git-interactive-checkout

$env.CARGO_TARGET_DIR = "/home/nishan/.cargo/target"
$env.ANDROID_HOME = "/home/nishan/Android/Sdk"
$env.FLYCTL_INSTALL = "/home/nishan/.fly"
$env.PATH = (
  $env.PATH |
  append "/home/nishan/.local/bin" |
  append "/home/nishan/.cargo/bin" |
  append "/home/nishan/.local/share/gem/ruby/3.0.0/bin" |
  append $"($env.FLYCTL_INSTALL)/bin"
)

