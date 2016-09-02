" 增加C++11/C++14/boost的语法高亮
call dein#add('octol/vim-cpp-enhanced-highlight', { 'on_ft': ['c', 'cpp'] })


" Markdown高亮
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})

let g:vim_markdown_toc_autofit      = 1
let g:vim_markdown_frontmatter      = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1


" Python自动缩进
call dein#add('vim-scripts/indentpython.vim', {'on_ft': 'python'})
