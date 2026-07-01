def isLinux [] { sys  host | get long_os_version | str contains --ignore-case "Linux" }
def isMac [] { sys  host | get long_os_version | str contains --ignore-case "MacOS" }

let nishan_home = if (isLinux) { "/home/nishan" } else { "/Users/nishan" }

def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $"--status=($env.LAST_EXIT_CODE)"
}

$env.STARSHIP_SHELL = "nu"
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.CARGO_TARGET_DIR = $"($nishan_home)/.cargo/target"
$env.ANDROID_HOME = $"($nishan_home)/Android/Sdk"
$env.EDITOR = "nvim"
$env.PATH = (
  $env.PATH |
  append $"($nishan_home)/.local/bin" |
  append $"($nishan_home)/.opencode/bin" |
  append $"($nishan_home)/.cargo/bin" 
)

alias edit = nvim
alias fopen = /usr/bin/open
alias suedit = sudo nvim
alias pac = paru
alias sysd = sudo systemctl
alias cat = bat -pp
alias rm = trash
alias checkout = git-interactive-checkout
