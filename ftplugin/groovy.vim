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
