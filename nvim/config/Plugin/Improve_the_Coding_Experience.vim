" 神级补全插件
call dein#add('Valloric/YouCompleteMe', {'on_ft': ['c', 'cpp', 'python'], 'on_i': 1 })

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '⚠'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F3> :YcmForceCompileAndDiagnostics<CR>
inoremap <F3> <C-O>:YcmForceCompileAndDiagnostics<CR>
nnoremap <F4> :YcmDiags<CR>
let g:ycm_key_list_select_completion = ['<c-j>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<c-p>', '<Up>']

"* 
"* YouCompleteMe详细安装方法
"* 
"* 先在Vim中执行PlugInstall安装Plugin部分，然后执行以下命令：
"* sudo zypper in llvm-clang-devel python-devel cmake
"* python ~/.cache/dein/repos/github.com/Valloric/YouCompleteMe/install.py --clang-completer --system-libclang
"* sed -i s/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/\"\&/g ~/.cache/dein/repos/github.com/Valloric/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 使用BundleUpdate (或BundleInstall!) 升级Plugin前**可能**需要使用以下命令还原，因为有产生git冲突的风险。更新完成后使用上方sed命令重新打上补丁：
"* sed -i s/\"echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/g ~/.cache/dein/repos/github.com/Valloric/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 参考：https://petitming.github.io/%E6%8A%98%E9%A8%B0/2015/12/27/YCM/
"* 


" 代码块
" #提供对插入代码块的支持
call dein#add('SirVer/ultisnips', { 'on_i': 1 })
" #提供具体代码块
call dein#add('honza/vim-snippets', { 'on_i': 1 })

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'


" 自动格式化代码
call dein#add('rhysd/vim-clang-format', { 'on_cmd': 'ClangFormat' })

noremap <F2> :ClangFormat<CR>
"let g:clang_format#command="clang-format"
let g:clang_format#code_style="google"
"let g:clang_format#auto_format=1
"let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_formatexpr=1
let g:clang_format#style_options={
    \ "AlignConsecutiveAssignments": "true",
    \ "AlignTrailingComments": "true",
    \ "AlignConsecutiveDeclarations": "true",
    \ "Cpp11BracedListStyle": "true",
    \ "MaxEmptyLinesToKeep": 3,
    \ "SpacesBeforeTrailingComments": 1,
    \ "PointerAlignment": "Right",
    \ "Standard": "Cpp11",
    \ "IndentWidth": 4,
    \ "IndentCaseLabels": "true",
    \ "SpaceAfterCStyleCast": "true",
    \ "SpacesInParentheses": "false",
    \ "SpacesInSquareBrackets": "false", }


" 削减代码折叠对性能的影响
call dein#add('Konfekt/FastFold', { 'on_cmd': 'za' })
