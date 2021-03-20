scriptencoding utf-8
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
let mapleader = "\<Space>"

call plug#begin('~/.nvim/plugged')

Plug 'kyazdani42/nvim-tree.lua'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'
Plug 'dyng/ctrlsf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'markvincze/panda-vim'

" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

Plug 'kannokanno/previm'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'schickling/vim-bufonly'
Plug 'rbgrouleff/bclose.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-scala'

Plug 'rust-lang/rust.vim'

Plug 'dense-analysis/ale'
" Plug 'neomake/neomake'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-abolish'
Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular'              " required by vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'

call plug#end()


function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction




let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 0 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 0,
    \}
let g:nvim_tree_width_allow_resize = v:true
" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:nvim_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     'sv',
    \ 'edit_split':      'ss',
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'f',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \}

let g:nvim_tree_icons = {
    \ 'default': '  ',
    \ 'symlink': '  ',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': " ",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "+",
    \   'open': "-"
    \  }
    \ }
nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap @ :NvimTreeFindFile<CR>
autocmd FileType NvimTree set cursorline
autocmd FileType NvimTree hi CursorLine cterm=none ctermfg=10 ctermbg=234
autocmd FileType NvimTree hi CursorLine guifg=springgreen
autocmd FileType NvimTree hi! link Directory PreProc




nnoremap <silent> >  :exe "vertical resize +10"<CR>
nnoremap <silent> <  :exe "vertical resize -10"<CR>






let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
function! AirlineInit()
    let g:airline#extensions#default#layout = ['a', 'b', 'c', 'x', 'y', 'z']
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline_section_b = '%{airline#extensions#branch#head()}'
let g:airline_section_c = '%{strpart(expand("%:p"), strlen(getcwd())+1)}'
let g:airline_section_x = ''
let g:airline_section_y = ''
" let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_section_z = '%3p%%'
let g:airline_skip_empty_sections = 1
let g:airline_theme="tomorrow"




"   map <silent> <expr> <C-g> (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Clap files --type f --no-ignore<CR>"
"   map <silent> <expr> <C-p> (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Clap filer<CR>"
"   map <silent> <expr> <Leader>l (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Clap buffers<CR>"
"   map <silent> <expr> <Leader>t (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Clap tags<CR>"
"   map <silent> <expr> <Leader>m (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Clap grep2<CR>"
"   autocmd FileType clap_input inoremap <silent> <buffer> <ESC>  <Esc>:<c-u>call clap#handler#exit()<CR>
"   let g:clap_maple_delay = 0
"   let g:clap_popup_input_delay = 0
"   let g:clap_on_move_delay = 0
"   let g:clap_provider_grep_delay = 0
"   let g:clap_disable_run_rooter = 1
"   let g:clap_layout = { 'width': winwidth(0) * 3 / 4, 'height': winheight(0) / 2, 'row': winheight(0) / 8, 'col': winwidth(0) / 8 }
"   let g:clap_provider_grep_blink = [0, 0]
"   " let g:clap_theme = 'solarized_light'



map <silent> <expr> <C-g> (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Files<cr>"
map <silent> <expr> <Leader>l (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Buffers<CR>"
map <silent> <expr> <Leader>t (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":BTags<CR>"
map <silent> <expr> <Leader>m (expand('%') =~ 'NvimTree' ? "\<c-w>\<c-w>" : '').":Rg<CR>"
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }



nnoremap <leader>a :CtrlSF
nnoremap <leader>s :CtrlSFOpen <CR>
nnoremap <Leader>f yiw :CtrlSF "<C-R>""<CR>
vnoremap <Leader>a y<ESC> :CtrlSF "<C-R>""
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_extra_backend_args = {'rg': '--no-ignore'}
command! -nargs=? -complete=buffer -bang BL :call BufOnly('<args>', '<bang>')




let g:ale_linters = {'go': ['golangci-lint', 'govet'], 'java': []}
let g:ale_lint_on_text_changed = 0
" let g:ale_fixers = {'go': ['goimports', 'gofmt'], '*': []}
" let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options=" -s -w "
let g:ale_go_golangci_lint_options = " "
let g:ale_c_parse_makefile = 1



let g:previm_open_cmd = 'open -a Safari'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END



let g:vista_echo_cursor = 1
let g:vista_cursor_delay = 400
let g:vista_echo_cursor_strategy = 'echo'
let g:vista#renderer#enable_icon = 0
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
" let g:vista#renderer#ctags='kind'
let g:vista_disable_statusline = 1
let g:vista_sidebar_width = 50
let g:vista_enable_centering_jump = 0
nnoremap <Leader>o :Vista!! <CR>
autocmd FileType vista noremap <buffer> <c-left> <nop>
autocmd FileType vista noremap <buffer> <c-h> <nop>
autocmd FileType vista noremap <buffer> <c-right> <nop>
autocmd FileType vista noremap <buffer> <c-l> <nop>
autocmd FileType vista noremap <buffer> <Leader>L <nop>



nnoremap <silent> gd            <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>h     <cmd>lua vim.lsp.buf.hover()<CR>
function! LspMaybeHighlight() abort
  lua pcall(vim.lsp.util.buf_clear_references)
  lua pcall(vim.lsp.buf.document_highlight)
endfunction
augroup lsp_aucommands
  au!
  au CursorMoved * call LspMaybeHighlight()
augroup END

lua << EOF
  local nvim_lsp = require'lspconfig'
  local completion = require'completion'
  local on_attach = function(_, bufnr)
    completion.on_attach()
  end
  nvim_lsp.rust_analyzer.setup({on_attach=on_attach})
  nvim_lsp.gopls.setup({on_attach=on_attach})
  nvim_lsp.sumneko_lua.setup({on_attach=on_attach})
  nvim_lsp.clangd.setup({on_attach=on_attach})
EOF

lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_get_var, 'is_doing_easymotion')
      if not ok then
        return true
      end
      return result == 0
    end,
    virtual_text = false,
  }
)
EOF

nnoremap <C-k> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c




let g:multi_cursor_exit_from_insert_mode=0
function! Multiple_cursors_before()
  let g:ale_enabled=0
endfunction
function! Multiple_cursors_after()
  let g:ale_enabled=1
endfunction



let g:go_imports_autosave = 1
let g:go_fmt_autosave=1
let g:go_def_mapping_enabled=0
let g:go_doc_popup_window = 1
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_diagnostics_enabled = 0
let g:go_echo_command_info = 0
let g:go_echo_go_info=0


let g:user_emmet_leader_key='<C-C>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required = 0
let g:prettier#config#tab_width = 4


let g:rust_fold = 1
let g:perl_fold = 1
let g:python_fold = 1
let g:erlang_fold = 1
let g:go_fold = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A']
let g:fastfold_savehook = 0
let g:vim_markdown_folding_disabled = 1


let g:indent_guides_guide_size = 1



map <Leader>p <Plug>(Prettier):retab <CR>



let g:is_doing_easymotion = 0
function! DoingEasyMotion()
  let g:is_doing_easymotion = 1
  let cancelled = EasyMotion#WB(0,2)
  let g:is_doing_easymotion = 0
endfunction
nmap f :call DoingEasyMotion()<CR>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable(".cscope.out")
        cs add .cscope.out
    endif
    set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

if filereadable(".tags")
    set tags=.tags
else
    set tags=tags
endif




"""""""""""""""""""""""""""""""""""""""
"""""""" Settings for Mappings """""""""
"""""""""""""""""""""""""""""""""""""""

nnoremap J mzJ`z
noremap H ^
noremap L $
vnoremap L g_

nmap <C-m> %
vmap <C-m> %

noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-l> :bnext<CR>

nnoremap <silent> <Leader>q :Bclose<CR>
nnoremap <silent> <Leader>x <C-w>c

map <Leader>L :set invnumber<CR>

map <Leader>T :%s/\s\+$//<CR>
map <Leader>U :g/^$/d<CR>
map <Leader>R :retab<CR>
map <Leader>. :@:<CR>
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>
nnoremap <silent> <leader>b :nohlsearch<CR>
nnoremap <Leader>= :wincmd =<CR>
nnoremap <Leader>c :let @+=expand('%:p')<CR>

nmap S :%sno##g<LEFT><LEFT>
vnoremap <C-r> "hy:%sno#<C-r>h##gc<left><left><left>

" map C-j in all modes to save buffer
noremap  <C-j>      :w<CR>
noremap! <C-j> <ESC>:w<CR>
noremap  <Leader>w :w<CR>

noremap <C-t> :b#<CR>

" map C-y in insert modes to paste
inoremap <C-y> <C-r>"

nnoremap m <C-d>
nnoremap , <C-u>
nnoremap ; zz
nnoremap ' zt<C-y>

vnoremap // y/<C-R>"<CR>"

vnoremap p "_dp
vnoremap P "_dP


nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>


set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-Z>
noremap <C-q> <C-y>

command! Jsonf :execute '%!python2 -m json.tool'
  \ | :execute '%!python2 -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'



" inoremap <C-e> <C-o>A
" inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-k> <C-o>D
inoremap <C-t> <C-o>O


function! MyHighlights() abort
    " for term
    hi Search                       cterm=none              ctermfg=232         ctermbg=214
    hi SpellCap                                             ctermfg=black       ctermbg=green
    hi LspReferenceText                                     ctermfg=black       ctermbg=green
    hi LspDiagnosticsError                                  ctermfg=cyan
    hi SignColumn                                           ctermfg=white       ctermbg=black
    hi Whitespace                                           ctermfg=DarkGray
    hi ALEError                     cterm=underline,bold    ctermfg=red
    hi ALEWarning                   cterm=underline,bold    ctermfg=red
    hi VertSplit                                            ctermfg=green       ctermbg=black
    hi multiple_cursors_cursor                              ctermfg=green       ctermbg=red
    hi multiple_cursors_visual                              ctermfg=black       ctermbg=white
    hi LineNr                                                                   ctermbg=NONE
    hi Normal                                               ctermbg=234


    " for gui
    hi Search                       gui=NONE                guifg=black         guibg=goldenrod2
    hi SpellCap                                             guifg=black         guibg=springgreen
    hi LspReferenceText                                     guifg=black         guibg=limegreen
    hi LspDiagnosticsError                                  guifg=cyan
    hi SignColumn                                           guifg=white
    hi Whitespace                                           guifg=DarkSlateGray
    hi ALEError                     gui=underline,bold      guifg=red
    hi ALEWarning                   gui=underline,bold      guifg=red
    hi VertSplit                                            guifg=springgreen   guibg=NONE
    hi multiple_cursors_cursor                              guifg=springgreen   guibg=red
    hi multiple_cursors_visual                              guifg=black         guibg=white
    hi LineNr                                                                   guibg=NONE
    hi Normal                                                                   guibg=#1c1c1c

    " hi Pmenu                ctermfg=238 ctermbg=252
    " hi PmenuSel             cterm=reverse ctermfg=238 ctermbg=252
    " hi PmenuSbar            ctermbg=248 guibg=Grey
    " hi PmenuThumb           ctermbg=0 guibg=Black
    " hi Pmenu                ctermfg=0       ctermbg=6
    " hi PmenuSel             ctermfg=NONE    ctermbg=24      cterm=NONE

    " hi ActiveWindow         ctermbg=235
    " hi InactiveWindow       ctermbg=236
    " set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

if has("termguicolors")
    set termguicolors
endif
colorscheme space-vim-dark



"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for FileType
"""""""""
"""""""""""""""""""""""""""""""""""""""

autocmd FileType qf wincmd J

" default is expand tab
set expandtab
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json
autocmd BufNewFile,BufReadPost *.go set shiftwidth=4 softtabstop=4 expandtab!
autocmd BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!
autocmd BufNewFile,BufReadPost *.js set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType scss set iskeyword+=-
autocmd BufNewFile,BufReadPost *.scss set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufReadPost *.sh set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufReadPost *.sls set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufReadPost *.lua set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufReadPost *.json set shiftwidth=4 softtabstop=4




"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for normal vi
"""""""""
"""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set list
set hid

set number
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000
set scrolloff=10
set foldmethod=syntax
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent
set mouse=
set clipboard^=unnamed,unnamedplus
cmap w!! %!sudo tee > /dev/null %
set backspace=indent,eol,start
let pair_program_mode = 0

noremap K <nop>
nnoremap Q <nop>
map q: :q

set maxmempattern=20000
set timeoutlen=1000 ttimeoutlen=0

syntax on
set number
set nowrap
set vb
set ruler

set incsearch
set ignorecase
set smartcase
set hlsearch
set nostartofline

set exrc
set secure


"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for Custom Funcs
"""""""""
"""""""""""""""""""""""""""""""""""""""

nnoremap <F3> :set wrap!<Enter>

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
nnoremap <F4> :call ToggleMouse() <Enter>

nnoremap <F8> *

set pastetoggle=<F2>

function! ToggleFold()
    let &foldlevel = 100 - &foldlevel
    :normal zz
endfunc
nnoremap zm :call ToggleFold() <Enter>
nnoremap zo zA

function! s:CopyToTmux()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let tempfile = tempname()
  call writefile(lines, tempfile, "b")
  call system('tmux load-buffer '.tempfile)
  call delete(tempfile)
endfunction
vnoremap <silent> Y :call <sid>CopyToTmux()<cr>


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction
" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif


"------  Local Overrides  ------
if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif


filetype plugin indent on

