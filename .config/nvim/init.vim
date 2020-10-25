" plugins{{{
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/restore_view.vim'
Plug '907th/vim-auto-save'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'thinca/vim-quickrun'
Plug 'milkypostman/vim-togglelist'
Plug 'raimondi/delimitmate'
Plug 'tomtom/tcomment_vim'
call plug#end()"}}}
" leader mappings{{{
" define leader
let mapleader = "\<Space>"

" quickrun
noremap <silent><leader>t :QuickRun<cr>
nmap <silent><leader>p :silent! cclose<CR>

" fast save
noremap <silent><leader>s :silent write!<cr>

" fast quit
noremap <silent><leader>q :silent quit!<cr>

" force save
noremap <silent><leader>w :silent w !sudo tee %<cr>

" quit if readonly and save if writeable
noremap <expr><leader>r &readonly ? ":q<cr>" : ":wq!<cr>" "}}}
" mappings{{{
" navigation
nnoremap n h
nnoremap i l
nnoremap e gj
nnoremap u gk
nnoremap <c-e> <c-d>

" visual mode navigation
vnoremap n h
vnoremap i l
vnoremap e j
vnoremap u k

" window navigation
nnoremap <leader>gn <C-W>h
nnoremap <leader>ge <C-W>j
nnoremap <leader>gu <C-W>k
nnoremap <leader>gn <C-W>l

" go to next/previous search match
nnoremap E n
nnoremap U N

" undo/redo
nnoremap l :undo<cr>
nnoremap L :redo<cr>

" toggle folds
nnoremap t za"}}}
" options{{{
" no backwards compatability with vim
set nocompatible

" syntax highlighting
syntax on

" use wal
colorscheme wal

" set fillchar
set fillchars=fold:\ 

" natural split spawning
set splitbelow splitright

" try to recognize filetypes
filetype plugin indent on             

" limit number of entries in completin menu
set pumheight=16

" don't use backups
set nobackup nowritebackup
set noswapfile

" completeopt
"set completeopt=longest,menuone

" share clipboard
set clipboard=unnamedplus

" wildmenu
set wildmenu

" search as we go
set incsearch

" control case handling
set ignorecase smartcase

" hide mode and commands
set noshowmode noshowcmd

" utf-8
set encoding=utf-8

" use marker method
set foldmethod=marker"}}}
" coc{{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" coc error highlight color
" :h coc-highlights
highlight default link CocErrorFloat Pmenu
highlight default link CocWarningFloat Pmenu
highlight CocErrorSign ctermfg=1
highlight CocInfoSign ctermfg=4
highlight CocWarningSign ctermfg=3

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <leader>g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>G <Plug>(coc-diagnostic-next)

" Goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent><leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>"}}}
" jedi {{{
let g:jedi#completions_enabled = 0
let g:jedi#rename_command = ""
let g:jedi#smart_auto_mappings = 0
let g:jedi#disable_default_mappings = 1
let g:jedi#auto_vim_configuration = 0
"}}}
" quickrun {{{
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':10split',
      \'outputter/buffer/into': '1',
      \'outputter/buffer/running_mark': '!'},}
"}}}
" vim-auto-save {{{
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged"] "}}}
" highlighting {{{
highlight Search ctermbg=10
highlight Visual ctermfg=8
highlight Pmenu ctermfg=7 ctermbg=238
highlight PmenuSel ctermfg=7 ctermbg=8
highlight PmenuSbar ctermbg=0
highlight PmenuThumb ctermbg=7
highlight MatchParen cterm=none ctermbg=green ctermfg=none "}}}
" au{{{
" disable autocommenting
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" clear errormsg when moving cursor
autocmd CursorMoved,CursorHold * echo

" json syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" hide fold markers
au BufRead,BufNewfile * syn match fmrkr '"*{{{\|"*}}}' |
  \ syn cluster vimCommentGroup contains=fmrkr |
  \ hi fmrkr term=NONE guibg=black guifg=black
  \ ctermbg=black ctermfg=black"}}}
" statusline{{{
set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %{StatusDiagnostic()}
set statusline+=\ 
set statusline+=\ %{fugitive#head()}
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ "}}}
" functions {{{
	function! StatusDiagnostic() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  if get(info, 'error', 0)
	    call add(msgs, ' ' . info['error'])
	  endif
	  if get(info, 'warning', 0)
	    call add(msgs, ' ' . info['warning'])
	  endif
	  return join(msgs, ' ')
	endfunction "}}}
