""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs

let s:nerdfont = get(g:, 'nerdfont', 0)

let s:indicator_warnings = get(g:, 'lightline#lsp#indicator_warnings', '•')
let s:indicator_errors = get(g:, 'lightline#lsp#indicator_errors', '×')
let s:indicator_info = get(g:, 'lightline#lsp#indicator_info', '~')
let s:indicator_hints = get(g:, 'lightline#lsp#indicator_hints', '>')
" let s:indicator_ok = get(g:, 'lightline#lsp#indicator_ok', (s:nerdfont ? "\uf058" : '✓'))
let s:indicator_ok = get(g:, 'lightline#lsp#indicator_ok', '✓')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#lsp#warnings() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('Warning')
  return l:counts == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts)
endfunction

function! lightline#lsp#errors() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('Error')
  return l:counts == 0 ? '' : printf(s:indicator_errors . '%d', l:counts)
endfunction

function! lightline#lsp#info() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('Information')
  return l:counts == 0 ? '' : printf(s:indicator_info . '%d', l:counts)
endfunction

function! lightline#lsp#hints() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('Hint')
  return l:counts == 0 ? '' : printf(s:indicator_hints . '%d', l:counts)
endfunction

function! lightline#lsp#ok() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:countSum()
  return l:counts == 0 ? s:indicator_ok : ''
endfunction

" function! lightline#lsp#status()
"   return get(g:, 'lsp_status', '')
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Register

function! lightline#lsp#register() abort
  " lua require('jg.lightline.lsp').setup()

  call s:setLightline('component_expand', 'lsp_status',   'lightline#lsp#status')
  call s:setLightline('component_expand', 'lsp_warnings', 'lightline#lsp#warnings')
  call s:setLightline('component_expand', 'lsp_errors',   'lightline#lsp#errors')
  call s:setLightline('component_expand', 'lsp_info',     'lightline#lsp#info')
  call s:setLightline('component_expand', 'lsp_hints',    'lightline#lsp#hints')
  call s:setLightline('component_expand', 'lsp_ok',       'lightline#lsp#ok')

  call s:setLightline('component_type', 'lsp_warnings', 'warning')
  call s:setLightline('component_type', 'lsp_errors',   'error')
  call s:setLightline('component_type', 'lsp_info',     'info')
  call s:setLightline('component_type', 'lsp_hints',    'hint')
  call s:setLightline('component_type', 'lsp_ok',       'left')

  " call s:setLightline('component_function', 'lsp_status', 'lightline#lsp#status')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions

function! s:count(level) abort
  return luaeval('vim.lsp.diagnostic.get_count(' . bufnr() . ', [[' . a:level . ']])') || 0
endfunction

function! s:countSum() abort
  let info = get(b:, 'lsp_diagnostic_info', {})
  return s:count('Error') + s:count('Warning')
endfunction

function! s:isHidden()
  return !luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients('.bufnr().'))') || exists('*lightline#sensible#isHidden') && lightline#sensible#isHidden()
endfunction

function! s:setLightline(scope, name, value) abort
  let g:lightline = get(g:, 'lightline', {})
  let g:lightline[a:scope] = get(g:lightline, a:scope, {})
  let g:lightline[a:scope][a:name] =  get(g:lightline[a:scope], a:name, a:value)
endfunction


