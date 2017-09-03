" ~stolen from github.com/fatih/vim-go -- same license

" install necessary Go tools
if exists("g:loaded_godoctor")
    finish
endif
let g:loaded_godoctor = 1

" These commands are available on any filetypes
command! GoDoctorInstall call godoctor#installGodoctor()

" Copyright 2015 Auburn University and The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

" Vim integration for the Go Doctor.

" TODO: If a refactoring only affects a single file, allow unsaved buffers
" and pipe the current buffer's contents into the godoctor via stdin
" (n.b. the quickfix list needs to be given a real filename to point to
" errors, so the godoctor's use of -.go and /dev/stdin in the log aren't good
" enough)
" TODO: Pass an option to the godoctor to limit the number of modifications.
" If it's going to try to open 100 new buffers, fail.  Consider a fallback
" option to write files in-place.

" NOTES
" -- Windows and buffers:
" http://vimdoc.sourceforge.net/htmldoc/windows.html
" -- Simulating hyperlinks in Vim:
" http://stackoverflow.com/questions/10925030/vimscriptl-file-browser-hyperlink
" -- Shell escaping/temp file problems under Windows
" http://vim.wikia.com/wiki/Fix_errors_that_relate_to_reading_or_creating_files_in_the_temp_or_tmp_environment_on_an_MS_Windows_PC
" -- Inserting the contents of a variable into a buffer
" http://stackoverflow.com/questions/16833217/set-buffer-content-with-variable
" -- Calling a varargs function
" http://stackoverflow.com/questions/11703297/how-can-i-pass-varargs-to-another-function-in-vimscript
" -- Trim whitespace from a string
" http://newsgroups.derkeiler.com/Archive/Comp/comp.editors/2005-08/msg00226.html
" -- Go Doctor ASCII art uses the AMC 3 Line font, generated here:
" http://patorjk.com/software/taag/#p=display&v=3&f=AMC%203%20Line&t=Go%20Doctor
" -- General Vimscript reference:
" http://vimdoc.sourceforge.net/htmldoc/eval.html

command! -range=% -nargs=* Rename
  \ call godoctor#RunRename(<count>, <f-args>)

command! -range=% -nargs=+ -complete=custom,<sid>list_refacs GoRefactor
  \ call godoctor#RunDoctor(<count>, <f-args>)

command! -range=% -nargs=+ -complete=custom,<sid>list_refacs Refactor
  \ call godoctor#RunDoctor(<count>, <f-args>)
