" call ale#Set('groovy_groovy_executable', 'npm-groovy-lint')
"
" call ale#linter#Define('groovy', {
"       \   'name': 'groovy',
"       \   'executable': {b -> ale#Var(b, 'groovy_groovy_executable')},
"       \   'command': '%e --noserver --returnrulesi ----output "json" -s %t',
"       \   'output_stream': 'stderr',
"       \   'callback': 'ale#handlers#groovy#HandleSyntaxErrors',
"       \})
" let b:ale_fixers = ['groovy']
"
"
set tabstop=4
set shiftwidth=4

" tagbar
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package:1',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'm:methods',
        \ 'f:fields:1'
    \ ]
\ }
