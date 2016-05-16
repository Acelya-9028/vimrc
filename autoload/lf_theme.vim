fun! lf_theme#contrast(delta)
  if g:colors_name =~# "^solarized8"
    let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
    execute "colorscheme" l:schemes[(a:delta+index(l:schemes, g:colors_name)) % 4]
  elseif g:colors_name =~# "^gruvbox"
    let l:schemes = ["hard", "medium", "soft"]
    execute 'let' ((&background == 'dark') ? 'g:gruvbox_contrast_dark' : 'g:gruvbox_contrast_light') '='
          \ 'get(l:schemes, (a:delta+index(l:schemes, (&background == "dark") ? g:gruvbox_contrast_dark : g:gruvbox_contrast_light)) % 3)'
    colorscheme gruvbox
  elseif g:colors_name =~# "^seoul256-light"
    let g:seoul256_light_background = (g:seoul256_light_background + a:delta > 256
          \ ? 252
          \ : (g:seoul256_light_background + a:delta < 252
            \ ? 256
            \ : g:seoul256_light_background + a:delta)
            \ )
    colorscheme seoul256-light
  elseif g:colors_name =~# "^seoul256"
    let g:seoul256_background = (g:seoul256_background + a:delta > 239
          \ ? 233
          \ : (g:seoul256_background + a:delta < 233
            \ ? 239
            \ : g:seoul256_background + a:delta)
            \ )
    colorscheme seoul256
  elseif g:colors_name =~# "^pencil"
    let g:pencil_higher_contrast_ui = 1 - g:pencil_higher_contrast_ui
    colorscheme pencil
  endif
endf

fun! lf_theme#toggle_bg_color()
  if g:colors_name =~# "^seoul256-light"
    colorscheme seoul256
  elseif g:colors_name =~# "^seoul256"
    colorscheme seoul256-light
  elseif g:colors_name =~# "^Tomorrow-Night"
    colorscheme Tomorrow
  elseif g:colors_name =~# "^Tomorrow"
    colorscheme Tomorrow-Night-Eighties
  elseif g:colors_name =~# "dark"
    execute "colorscheme" substitute(g:colors_name, 'dark', 'light', '')
  elseif g:colors_name =~# "light"
    execute "colorscheme" substitute(g:colors_name, 'light', 'dark', '')
  else
    let g:lf_cached_mode = ""  " Force updating status line highlight groups
    let &background = (&background == 'dark') ? 'light' : 'dark'
  endif
endf

