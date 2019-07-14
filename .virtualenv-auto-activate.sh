#!/bin/bash
# virtualenv-auto-activate.sh
#
# Installation:
#   Add this line to your .bashrc or .bash-profile:
#
#       source /path/to/virtualenv-auto-activate.sh
#
#   Go to your project folder, run "virtualenv .venv", so your project folder
#   has a .venv folder at the top level, next to your version control directory.
#   For example:
#   .
#   ├── .git
#   │   ├── HEAD
#   │   ├── config
#   │   ├── description
#   │   ├── hooks
#   │   ├── info
#   │   ├── objects
#   │   └── refs
#   └── .venv
#       ├── bin
#       ├── include
#       └── lib
#
#   The virtualenv will be activated automatically when you enter the directory.
_virtualenv_auto_activate() {
    have_not_found=true
    for folderName in $(ls -l | awk '/^d/ {print $NF}'); do
        if [ -e "$folderName/bin/activate" ]; then
            have_not_found=false
            if [ "$VIRTUAL_ENV" = "" ]; then
                _VENV_NAME=$(basename `pwd`)
#                echo Activating virtualenv \"$_VENV_NAME\"...
                VIRTUAL_ENV_DISABLE_PROMPT=1
                source $folderName/bin/activate
                _OLD_VIRTUAL_PS1="$PS1"
                PS1="($_VENV_NAME)$PS1"
                export PS1
            fi
        fi
    done
    if $have_not_found ; then
        if [ "$VIRTUAL_ENV" != "" ]; then
#            echo Deactivating VirtualEnv
            deactivate
        fi
    fi
}

export PROMPT_COMMAND=_virtualenv_auto_activate
