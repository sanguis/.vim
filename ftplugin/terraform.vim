" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 1
let g:tagbar_type_terraform = {
      \ 'kinds' : [
        \ 'r:Resources',
        \ 'd:Datas',
        \ 'v:Variables',
        \ 'p:Providers',
        \ 'o:Outputs',
        \ 'm:Modules',
        \ 'f:TFVars',
        \ ],
        \ }

" shell editing
let g:tagbar_type_sh = {
      \' kinds': [
        \ 'f:functions',
        \ 'v:variables'
        \]
        \}
