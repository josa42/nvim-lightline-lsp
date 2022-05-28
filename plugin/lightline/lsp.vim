augroup lightline#coc
  autocmd!
  autocmd DiagnosticChanged * call lightline#update()
  " autocmd User CocStatusChange call lightline#update()


  " augroup lsp_aucmds
  " au! * <buffer>
  " au User LspDiagnosticsChanged redrawstatus!
  " au User LspMessageUpdate redrawstatus!
  " au User LspStatusUpdate redrawstatus!
  " augroup END
augroup END

