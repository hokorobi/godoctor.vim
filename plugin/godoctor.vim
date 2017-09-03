" ~stolen from github.com/fatih/vim-go -- same license

" install necessary Go tools
if exists("g:loaded_godoctor")
    finish
endif
let g:loaded_godoctor = 1

" These commands are available on any filetypes
command! GoDoctorInstall call godoctor#installGodoctor()

