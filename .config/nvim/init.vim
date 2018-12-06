" ==================================================================================================
" Plugins
" ==================================================================================================

call plug#begin()

" Common
Plug 'airblade/vim-rooter'
Plug 'raghur/fruzzy', {
            \ 'do': { -> fruzzy#install()}
            \ }
Plug 'Shougo/denite.nvim', {
            \ 'do': ':UpdateRemotePlugins'
            \ }
Plug 'itchyny/lightline.vim'

" Version control
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'neoclide/denite-git'
Plug 'mhinz/vim-signify'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
Plug 'brooth/far.vim', {
            \ 'do': ':UpdateRemotePlugins'
            \ }
Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'

" Navitation
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'arakashic/chromatica.nvim', {
            \ 'do': ':UpdateRemotePlugins'
            \ }
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh'
            \ }
Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim', {
            \ 'do': ':UpdateRemotePlugins'
            \ }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/context_filetype.vim'

" Color schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'noahfrederick/vim-hemisu'
Plug 'aunsira/macvim-light'
Plug 'reedes/vim-colors-pencil'

call plug#end()


" ==================================================================================================
" Options
" ==================================================================================================

" Moving around, searching and patterns
set ignorecase
set smartcase

" Displaying text
set scrolloff=3
set lazyredraw
set number
set relativenumber

" Syntax, highlight and spelling
set cursorline
set colorcolumn=+1
set spelllang=en,fr

" Multiple windows
set winwidth=30
set winminwidth=30
set hidden
set splitright
set splitbelow

" Terminal
set title

" Messages and info
set shortmess+=sc
set noshowmode

" Selecting text
set clipboard=unnamedplus

" Editing text
set textwidth=100
set completeopt=menuone,preview
set nojoinspaces

" Tabs and indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" Command line editing
set wildignore+=.git,.hg,.svn,.ropeproject,__pycache__
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb,*.7z
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=*.min.*

" Various
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
set updatetime=300

" Color scheme
set termguicolors

" set background=light
" colorscheme hemisu
" colorscheme macvim-light

set background=dark
" colorscheme pencil
" colorscheme codedark
" colorscheme minimalist
colorscheme afterglow
" colorscheme hybrid_reverse
" colorscheme jellybeans
" colorscheme iceberg
" colorscheme lucid

" Auto commands
function! s:disable_comment_continuation() abort
    setlocal formatoptions-=ro
endfunction

function! s:restore_cusror() abort
    if line("'\"") > 1 && line("'\"") <= line('$') |
        execute "normal! g`\"" |
    endif
endfunction

augroup options_aug
    autocmd!
    autocmd BufEnter * call <SID>disable_comment_continuation()
    autocmd BufReadPost * call <SID>restore_cusror()
augroup END


" ==================================================================================================
" Plugins config
" ==================================================================================================

" rooter
let g:rooter_use_lcd = 1

" fruzzy
let g:fruzzy#usenative = 1

" denite
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" call denite#custom#source('file', 'args', ['new', '']) " Allow new file creation
call denite#custom#source('grep', 'args', ['', '', '!']) " Interactive grep
call denite#custom#source('line', 'args', ['buffers', 'noempty']) " Lines for all buffers

" magit
let g:magit_discard_untracked_do_delete = 1

" signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1

omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" far
let g:far#source = 'rgnvim'

" indentLine
let g:indentLine_char = '│'

" better-whitespace
let g:better_whitespace_enabled = 1
let g:show_spaces_that_precede_tabs = 1

" sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'QSDFGHJKLMAZERTYUIOPWXCVBN'

" incsearch
let g:incsearch#auto_nohlsearch = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" incsearch-fuzzy
function! s:incsearch_fuzzy(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzy#converter()],
                \ }), get(a:, 1, {}))
endfunction

" incsearch-easymotion
function! s:incsearch_easymotion(...) abort
    return extend(copy({
                \   'modules': [incsearch#config#easymotion#module()],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

function! s:incsearch_easymotion_fuzzy(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzy#converter()],
                \   'modules': [incsearch#config#easymotion#module()],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

" chromatica
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

" LanguageClient
let g:LanguageClient_serverCommands = {
            \ 'c': [
            \      'ccls',
            \      '--log-file=/tmp/ccls.log',
            \      '--init={"cacheDirectory":"/tmp/ccls_cache"}'
            \ ],
            \ 'cpp': [
            \      'ccls',
            \      '--log-file=/tmp/ccls.log',
            \      '--init={"cacheDirectory":"/tmp/ccls_cache"}'
            \ ]
            \ }
let g:LanguageClient_hasSnippetSupport = 0

function! s:LanguageClient_config() abort
    setlocal signcolumn=yes
    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

    call <SID>LanguageClient_mappings()
endfunction

augroup LanguageClient_aug
    autocmd!
    autocmd User LanguageClientStarted call <SID>LanguageClient_config()
augroup END

" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('smart_case', v:true)

function! s:deoplete_close_popup_cr() abort
    return deoplete#close_popup()."\<CR>"
endfunction

inoremap <silent> <CR> <C-r>=<SID>deoplete_close_popup_cr()<CR>

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'


" ==================================================================================================
" Mappings
" ==================================================================================================

" Map leaders
let g:mapleader = ' '
let g:maplocalleader = ' m'

" Denite
call denite#custom#map('insert', '<C-n>',  '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>',  '<denite:move_to_previous_line>', 'noremap')

" LanguageClient
function! s:LanguageClient_mappings() abort
    nnoremap <buffer> <silent> K     :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> gd    :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> gD    :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <C-;> :Denite codeAction<CR>

    nnoremap <buffer> <silent> <localleader>m  :Denite contextMenu<CR>
    nnoremap <buffer> <silent> <localleader>h  :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> <localleader>d  :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <localleader>D  :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <localleader>t  :call LanguageClient#textDocument_typeDefinition()<CR>
    nnoremap <buffer> <silent> <localleader>T  :call LanguageClient#textDocument_typeDefinition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <localleader>i  :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <buffer> <silent> <localleader>I  :call LanguageClient#textDocument_implementation({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <localleader>r  :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <localleader>s  :Denite documentSymbol<CR>
    nnoremap <buffer> <silent> <localleader>x  :Denite references<CR>
    nnoremap <buffer> <silent> <localleader>a  :Denite codeAction<CR>
    nnoremap <buffer> <silent> <localleader>f  :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <buffer> <silent> <localleader>_  :call LanguageClient#textDocument_documentHighlight()<CR>
    nnoremap <buffer> <silent> <localleader>c  :call LanguageClient#clearDocumentHighlight()<CR>
    nnoremap <buffer> <silent> <localleader>ws :Denite workspaceSymbol<CR>
    nnoremap <buffer> <silent> <localleader>wa :call LanguageClient#workspace_applyEdit()<CR>
endfunction

" File
nnoremap <silent> <leader>ff :Denite file file/rec<CR>
nnoremap <silent> <leader>fv :edit $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>fV :source $HOME/.config/nvim/init.vim<CR>

nnoremap <silent> <leader>fs :write<CR>
nnoremap <silent> <leader>fS :wall<CR>

let g:better_whitespace_operator = '<leader>fwt'
nnoremap <silent> <leader>fwn :NextTrailingWhitespace<CR>
nnoremap <silent> <leader>fwp :PrevTrailingWhitespace<CR>

" Buffer
nnoremap <silent> <leader><TAB> :b#<CR>

nnoremap <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bD :bdelete!<CR>

nnoremap <silent> <leader>bb :Denite buffer file_old<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bm :bmodified<CR>

" Version control
let g:magit_show_magit_mapping = '<leader>gm'

nnoremap <silent> <leader>gs :Denite gitstatus<CR>
nnoremap <silent> <leader>gl :Denite gitlog<CR>
nnoremap <silent> <leader>gL :Denite gitlog:all<CR>
nnoremap <silent> <leader>gc :Denite gitchanged<CR>
nnoremap <silent> <leader>gb :Denite gitbranch<CR>

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

" Search
noremap <silent> <expr> <leader>ss  incsearch#go(<SID>incsearch_fuzzy())
noremap <silent> <expr> <leader>sS  incsearch#go(<SID>incsearch_fuzzy({'command': '?'}))
noremap <silent> <expr> <leader>sgs incsearch#go(<SID>incsearch_fuzzy({'is_stay': 1}))

noremap <silent> <expr> <leader>sj incsearch#go(<SID>incsearch_easymotion())
noremap <silent> <expr> <leader>sJ incsearch#go(<SID>incsearch_easymotion_fuzzy())

nnoremap <silent> <leader>sG :Denite grep<CR>
nnoremap <silent> <leader>sl :Denite line<CR>

" Jump
nmap <leader>jf <Plug>(easymotion-overwin-f)
nmap <leader>js <Plug>(easymotion-overwin-f2)
nmap <leader>jw <Plug>(easymotion-overwin-w)
nmap <leader>jl <Plug>(easymotion-overwin-line)

" Misc
nnoremap <silent> <leader>: :Denite command_history command<CR>
nnoremap <silent> <leader>y :Denite register<CR>
nnoremap <silent> <leader>h :Denite help<CR>

" Window
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>wv :vertical split<CR>
nnoremap <silent> <leader>wn :new<CR>
nnoremap <silent> <leader>wN :vertical new<CR>

nnoremap <silent> <leader>wq :quit<CR>
nnoremap <silent> <leader>wQ :quit!<CR>
nnoremap <silent> <leader>wc :close<CR>
nnoremap <silent> <leader>wC :close!<CR>
nnoremap <silent> <leader>wo :only<CR>
nnoremap <silent> <leader>wO :only!<CR>
nnoremap <silent> <leader>wz :pclose!<CR>

nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>ww :wincmd w<CR>
nnoremap <silent> <leader>wW :wincmd W<CR>
nnoremap <silent> <leader>wt :wincmd t<CR>
nnoremap <silent> <leader>wb :wincmd b<CR>
nnoremap <silent> <leader>wp :wincmd p<CR>
nnoremap <silent> <leader>wP :wincmd P<CR>

nnoremap <silent> <leader>wr :wincmd r<CR>
nnoremap <silent> <leader>wR :wincmd R<CR>
nnoremap <silent> <leader>wx :wincmd x<CR>
nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>
nnoremap <silent> <leader>wT :wincmd T<CR>

nnoremap <silent> <leader>w= :wincmd =<CR>
nnoremap <silent> <leader>w_ :resize<CR>
nnoremap <silent> <leader>w/ :vertical resize<CR>
nnoremap <silent> <leader>wm :resize<CR>:vertical resize<CR>

nnoremap <silent> <leader>w$  :wincmd ]<CR>
nnoremap <silent> <leader>w£  :vertical wincmd ]<CR>
nnoremap <silent> <leader>wg$ :wincmd g]<CR>
nnoremap <silent> <leader>wg£ :vertical wincmd g]<CR>
nnoremap <silent> <leader>wf  :wincmd f<CR>
nnoremap <silent> <leader>wF  :vertical wincmd f<CR>
nnoremap <silent> <leader>wgf :wincmd F<CR>
nnoremap <silent> <leader>wgF :vertical wincmd F<CR>

" Tab
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>tf :wincmd gf<CR>
nnoremap <silent> <leader>tF :wincmd gF<CR>

nnoremap <silent> <leader>tq :tabclose<CR>
nnoremap <silent> <leader>tQ :tabclose!<CR>
nnoremap <silent> <leader>to :tabonly<CR>
nnoremap <silent> <leader>tO :tabonly!<CR>

nnoremap <silent> <leader>th :tabnext<CR>
nnoremap <silent> <leader>tj :tabfirst<CR>
nnoremap <silent> <leader>tk :tablast<CR>
nnoremap <silent> <leader>tl :tabprevious<CR>

nnoremap <silent> <leader>tH :tabmove-<CR>
nnoremap <silent> <leader>tJ :tabmove0<CR>
nnoremap <silent> <leader>tK :tabmove$<CR>
nnoremap <silent> <leader>tL :tabmove+<CR>

" Quit
nnoremap <silent> <leader>qq :quitall<CR>
nnoremap <silent> <leader>q! :quitall!<CR>

nnoremap <silent> <leader>wq :write<CR>:quitall<CR>
nnoremap <silent> <leader>w! :wall<CR>:quitall<CR>

augroup quit_aug
    autocmd!
    autocmd FileType help nnoremap <silent> q :quit<CR>
augroup END
