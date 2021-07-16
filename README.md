# lightline-lsp

This plugin provides neovim buildin lsp diagnostics indicator for the [lightline](https://github.com/itchyny/lightline.vim) vim plugin.

![Example](.github/example-v2.jpg)

## Installation

Install using a plugin manager of your choice, for example [`vim-plug`](https://github.com/junegunn/vim-plug):

```viml
Plug 'josa42/vim-lightline-lsp'
```

## Components

- `lsp_errors`   Number of diagnostics errors
- `lsp_warnings` Number of diagnostics warnings
- `lsp_info`     Number of diagnostics information messages
- `lsp_hints`    Number of diagnostics hints
- `lsp_ok`       Checkmark if there are no errors or warnings
- `lsp_status`   Show status messages if there are any.

## Integration

```viml
let g:lightline = {
  \   'active': {
  \     'left': [[  'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' ], [ 'lsp_status' ]]
  \   }
  \ }

" register compoments:
call lightline#lsp#register()
```

**Or register manually**

```viml
" Register the components:
let g:lightline = {}
let g:lightline.component_expand = {
  \   'lsp_warnings': 'lightline#lsp#warnings',
  \   'lsp_errors': 'lightline#lsp#errors',
  \   'lsp_info': 'lightline#lsp#info',
  \   'lsp_hints': 'lightline#lsp#hints',
  \   'lsp_ok': 'lightline#lsp#ok',
  \   'status': 'lightline#lsp#status',
  \ }

" Set color to the components:
let g:lightline.component_type = {
  \   'lsp_warnings': 'warning',
  \   'lsp_errors': 'error',
  \   'lsp_info': 'info',
  \   'lsp_hints': 'hints',
  \   'lsp_ok': 'left',
  \ }

" Add the components to the lightline:
let g:lightline.active = {
  \   'left': [[ 'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' ], [ 'lsp_status' ]]
  \ }
```

## Configuration

- `g:lightline#lsp#indicator_warnings`
  The indicator to use when there are warnings. Default is `•`.

- `g:lightline#lsp#indicator_errors`
  The indicator to use when there are errors. Default is `×`.

- `g:lightline#lsp#indicator_info`
  The indicator to use when there are information messages. Default is `~`.

- `g:lightline#lsp#indicator_hints`
  The indicator to use when there are hints. Default is `>`.

- `g:lightline#lsp#indicator_ok`
  The indicator to use when there are no warnings or errors. Default is `✓`.

## Credit

- The plugin is based on [`maximbaz/lightline-ale`](https://github.com/maximbaz/lightline-ale)

## License

[MIT © Josa Gesell](LICENSE)
