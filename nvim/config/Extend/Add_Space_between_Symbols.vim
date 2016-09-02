"* 
"* 输入符号后在右边输入空格，左边也会添加空格
"* 增加符号请在下方[]中模仿添加
"* 暂未解决三个及以上符号连在一起的情况
"* 出处：http://forum.ubuntu.org.cn/viewtopic.php?t=394843
"* 

let g:space1 = ['+', '-', '*', '/', '%', '^', '=']
let g:space2 = [":=", "==", "!=", "<<", ">>", ">=", "<=", "+=", "-=", "/*=" ,"/=", "&&", "||", "//"]

inoremap <space> <c-r>=SmartSpace()<CR>
function! SmartSpace()
    ""取上一行光标附近词a:char
    for key in g:space2
        echo key
    endfor
    let a:char = ''
    let a:prechar=' '
    let a:lastchar=''
    for key in range(-8, 6)
        let a:char = a:char.getline(line('.')-1)[col('.') + key]
    endfor
    ""判断a:char是否含有单个符号
    for key in g:space1
        if -1 != match(a:char, '\t'.key.' ')
            let a:prechar = '   '
            let a:lastchar = ' '
        elseif -1 != match(a:char, ' '.key.' ')
            let a:prechar = ' '
            let a:lastchar = ''
        endif
    endfor
    ""判断a:char是否含有两个连续符号
    for key in g:space2
        if -1 != match(a:char, '    '.key.' ') && 0 != match(a:char, '  '.key.' ')
            let a:prechar = '   '
            let a:lastchar = ' '
        elseif -1 != match(a:char, ' '.key)
            let a:prechar = ' '
            let a:lastchar = ' '
        endif
    endfor
    ""当前行两个连续符号
    let a:char = getline('.')[col('.')-3].getline('.')[col('.')-2]
    for key in g:space2
        if a:char == key
            if "[ \t]" !~ getline('.')[col('.')-4]
                return "\<left>\<left>".a:prechar."\<right>\<right> "
            else
                return " "
            endif
        endif
    endfor
    ""当前行一个符号
    let a:char = getline('.')[col('.')-2]
    for key in g:space1
        if a:char == key
            if "[ \t]" !~ getline('.')[col('.')-3]
                return "\<left>".a:prechar."\<right> ".a:lastchar
            elseif '    ' =~ getline('.')[col('.')-3]
                return "  "
            endif
        endif
    endfor
    return " "
endfunction
