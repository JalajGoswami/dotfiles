alias python = python3
def gpu [branch] { git pull origin $branch }
def gps [branch] { git push origin $branch }
def gch [branch] { git checkout $branch }


# Define a function to set the terminal title
def set_title [title_str] { printf $"(ansi title)($title_str)(ansi st)" }

# Overriding default config
$env.config = {
    show_banner: false,
    shell_integration: {
        osc2: false
    },
    hooks: {
        env_change: {
            PWD: {
                let dir_name = (pwd | path basename);
                set_title $dir_name;
            }
        }
    }

}
