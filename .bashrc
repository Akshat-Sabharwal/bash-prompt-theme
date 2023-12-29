parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^]/d' -e 's/ \(.*\)/(\1)/'
}


PS1='\[\e[0;33m\]\u@\h \[\e[m\]'
if [ -f /usr/share/doc/bash/examples/dot.bashrc ]; then
    . /usr/share/doc/bash/examples/dot.bashrc
fi

# Customizing the bash prompt
if [ -z "$PS1" ]; then
    return
fi

update_prompt_command() {
    if [ "$CONDA_DEFAULT_ENV" != "base" ]; then
        if  ([ -d .git ] || git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
            PS1='\n\[\033[48;2;0;128;128m\]\[\033[38;2;255;255;255m\] ~ \[\033[48;2;51;51;51m\]\[\033[38;2;255;255;255m\] \W \[\033[48;2;100;112;163m\]\[\033[38;2;255;255;255m\] git:($(__git_ps1 "%s")) \[\033[48;2;50;75;75m\]\[\033[38;2;255;255;255m\] conda:($CONDA_DEFAULT_ENV) \[\033[0m\] $ '

        else
            PS1='\n\[\033[48;2;0;128;128m\]\[\033[38;2;255;255;255m\] ~ \[\033[48;2;51;51;51m\]\[\033[38;2;255;255;255m\] \W \[\033[48;2;50;75;75m\]\[\033[38;2;255;255;255m\] conda:($CONDA_DEFAULT_ENV) \[\033[0m\] $ '

        fi

    else 
        if ([ -d .git ] || git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
            PS1='\n\[\033[48;2;0;128;128m\]\[\033[38;2;255;255;255m\] ~ \[\033[48;2;51;51;51m\]\[\033[38;2;255;255;255m\] \W \[\033[48;2;100;112;163m\]\[\033[38;2;255;255;255m\] git:($(__git_ps1 "%s")) \[\033[0m\] $ '

        else 
            PS1='\n\[\033[48;2;0;128;128m\]\[\033[38;2;255;255;255m\] ~ \[\033[48;2;51;51;51m\]\[\033[38;2;255;255;255m\] \W \[\033[0m\] $ '

        fi

    fi
}

PROMPT_COMMAND="update_prompt_command"
