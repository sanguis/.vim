
" Input a List of colorscheems, use the fist one found
" TODO: Finish Colorschmes function
fun Colorschemes(list)
  :let avaiable_colors = getcompletion('', 'color')
  for scheme in a:list
    let scheme colorscheems->get(scheme)
    if scheme !=0
      set colorscheem=scheme
      return
    endif
  endfor
endf
