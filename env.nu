let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""
let-env PROMPT_INDICATOR = ""
let-env PROMPT_INDICATOR_VI_INSERT = ": "
let-env PROMPT_INDICATOR_VI_NORMAL = "〉"
let-env PROMPT_MULTILINE_INDICATOR = "::: "

alias edit = nvim
alias suedit = sudo nvim
alias pac = paru
alias sys = sudo systemctl
alias cat = bat -pp
alias rm = trash
alias checkout = git-interactive-checkout

let-env CARGO_TARGET_DIR = '/home/nishan/.cargo/target'

