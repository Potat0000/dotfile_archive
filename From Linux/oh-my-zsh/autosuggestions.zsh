# 0 : 淡灰 （基本不可见）
# 1 : 红   （大红，错误命令提示色）
# 2 : 绿豆色（正确命令提示色，powerline Git工作目录干净的背景色）
# 3 : 橙   （powerline Git有更改，工作目录不干净的背景色）
# 4 : 蓝   （powerline目录位置背景色）
# 5 : 梅红
# 6 : 青
# 7 : 白
# 其余数字均无效，显示为终端字体色（灰色）
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# 按Ctrl+Space使用自动补全项，或者使用默认的Ctrl+E
bindkey '^ ' autosuggest-accept
