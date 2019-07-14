"* 
"* Markdown文件进入插入模式时自动打开中文输入法
"* 所有文件退出插入模式时自动关闭中文输入法
"* Git Commit描述填写界面自动进入插入模式并切换为中文输入法
"* 进入、退出Goyo时自动启动、关闭行聚焦功能
"* 
autocmd InsertLeave *	if system('fcitx-remote') != 0 | call system('fcitx-remote -c') | endif
autocmd InsertEnter *.md,COMMIT_EDITMSG	if system('fcitx-remote') != 0 | call system('fcitx-remote -o') | endif
autocmd VimEnter COMMIT_EDITMSG	startinsert
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
"autocmd CursorHold,CursorHoldI *.cpp,*.c,*.h,*.hpp,*.cc ClangFormat
