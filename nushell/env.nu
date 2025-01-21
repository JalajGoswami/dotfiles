use ~/.config/nushell/starship.nu

$env.EDITOR = "vim"

def append_path [new_path] {
   $env.PATH | split row (char esep) | append $new_path
}

$env.PATH = append_path /usr/local/go/bin
$env.PATH = append_path $"($env.HOME)/go/bin"

printf '\x1b[34m
      ________    _______
     /_______/   / ___  /
        / /     / /  /_/
       / /     / / ____
  __  / /     / / /__ /
  \ \/ /     / /___/ /
   \__/     /_______/
\x1b[0m'
