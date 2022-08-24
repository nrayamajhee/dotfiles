let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""
let-env PROMPT_INDICATOR = ""

alias edit = nvim
alias suedit = sudo nvim
alias pac = paru
alias sysd = sudo systemctl
alias cat = bat -pp
alias rm = gio trash
alias checkout = git-interactive-checkout

let-env CARGO_TARGET_DIR = '/home/nishan/.cargo/target'
let-env PATH = (
  $env.PATH | append "/home/nishan/.local/bin" |
  append "/home/nishan/.cargo/bin" |
  append "/home/nishan/.local/share/gem/ruby/3.0.0/bin"
)
