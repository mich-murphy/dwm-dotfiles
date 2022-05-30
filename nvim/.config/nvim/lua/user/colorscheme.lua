vim.cmd [[
try
  let g:monokaipro_filter = "spectrum"
  let g:monokaipro_italic_keywords = 0
  let g:monokaipro_flat_float = 1
  let g:monokaipro_flat_sidebar = 1
  colorscheme monokaipro
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
