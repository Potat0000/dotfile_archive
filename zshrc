# oh-my-zsh安装目录
export ZSH=/home/gyj1109/.oh-my-zsh

# 自动刷新新安装的程序
zstyle ':completion:*' rehash true
setopt no_nomatch

# 主题
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=gyj1109
export TERM="xterm-256color"

# powerlevel9k主题设置
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_HIDE_BRANCH_ICON=true
#POWERLEVEL9K_SHOW_CHANGESET=true
#POWERLEVEL9K_CHANGESET_HASH_LENGTH=4
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv)

# 大小写敏感
# CASE_SENSITIVE="true"

# 不区分_与-
HYPHEN_INSENSITIVE="true"

#关闭自动更新
DISABLE_AUTO_UPDATE="true"

# 自动更新的检查天数
# export UPDATE_ZSH_DAYS=30

# ls命令不使用颜色
# DISABLE_LS_COLORS="true"

# 禁止自动更新终端名称（默认会刷新名称以现实所在目录或所执行的程序）
# DISABLE_AUTO_TITLE="true"

# 自动更正错误命令
ENABLE_CORRECTION="true"

# 自动补全时若无补全项时显示三个红点
COMPLETION_WAITING_DOTS="true"

# 取消对文件跟踪情况的检查
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# 历史命令日期显示格式，不设置则不显示
# 有且仅有三种格式可选: "mm/dd/yyyy" "dd.mm.yyyy" "yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# 更改$ZSH_CUSTOM目录（默认为$ZSH/custom）
# ZSH_CUSTOM=/path/to/new-custom-folder

# 插件（默认插件在$ZSH/plugins目录中）
# 自定义插件请放入$ZSH_CUSTOM/plugins/，子文件夹内的插件会自动搜索，所以可以用文件夹整理插件
# 请谨慎添加插件，添加过多的插件会拖慢启动、运行速度
plugins=(git z zsh-autosuggestions colored-man-pages colorize cp virtualenv extract web-search catimg wd sudo zsh-syntax-highlighting)



# 用户配置

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# 默认语言环境
export LANG=zh_CN.UTF-8

# 本地和远程会话的默认编辑器
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# 编译标志
# export ARCHFLAGS="-arch x86_64"

# ssh私钥位置
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# 自定义别名，在此定义不会覆盖在oh-my-zsh的库，插件和主题中提供的别名。
# 别名的定义放在这里可以生效，但是我们建议在ZSH_CUSTOM文件夹中定义的别名。
# 运行`alias`查看所有默认别名。
#
# 别名定义示例
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls='clear'
alias clang='clang++ -std=c++1z -Weverything'
alias clang++='clang++'
alias clang--='clang'
