" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/autoload')
hi Visual ctermbg=110 ctermfg=235 guibg=#8fafd7 guifg=#262626 cterm=NONE gui=NONE
" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'junegunn/seoul256.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'posva/vim-vue'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'JulesWang/css.vim'
Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'tpope/vim-dispatch'             
Plug 'tpope/vim-projectionist'       
Plug 'noahfrederick/vim-composer'   
Plug 'noahfrederick/vim-laravel'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

Plug 'jistr/vim-nerdtree-tabs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tomasr/molokai'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/deoplete-phpactor'

let g:deoplete#enable_at_startup = 1

let g:phpactorPhpBin = "/usr/bin/php"

let NERDTreeShowHidden=1

fu ExecuteCommand()
   let l:Command = expand("<cword>")
   execute "!" . l:Command
endfu
set keywordprg=!
set shell=/bin/bash
set encoding=utf-8
set number
set relativenumber
" set hlsearch
set nowrap
" set incsearch
" set nohlsearch
set expandtab
set nobackup
set noswapfile
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ignorecase
set smartcase

hi TabLineFill ctermbg=Black ctermfg=Black
hi TablineSel ctermfg=Yellow
hi Tabline ctermfg=DarkBlue

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


let g:indentLine_char_list = ['¦','.']
" nmap <F1> :q <CR>
" imap <F1>
" map <F1> :q <CR>
" silent! nmap <F2> :u<CR>
" silent! nmap <F3> :redo<CR>
" silent! nmap <F4> :w<CR>
" silent! nmap <F5> :q<CR>
silent! nmap <F3> :NERDTreeToggle<CR>
silent! nmap <F4> :call FindIfNotOpen()<CR>
silent! nmap <F5> :call ToggleNum() <CR>
" silent! nmap <F7> :setfiletype css<CR>
function ToggleNum() 
  if &number
    :set nonumber norelativenumber
    :set signcolumn=no
  else
    :set number relativenumber
    :set signcolumn=yes
  endif
endfunction
function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! WhichWindow(filename)
    " Try to determine whether the file is open in any GVIM *window*
    let serverlist = split(serverlist(),"\n")

    "let currentserver = ????
    for server in serverlist
        let remotetabnum = remote_expr(server, 
            \"WhichTab('".a:filename."')")
        if remotetabnum != 0
            return server
        endif
    endfor
endfunction
function FindIfNotOpen() 
  if IsNerdTreeEnabled()
    if exists("b:NERDTree")
      :wincmd l
      :NERDTreeFind
    else
      :NERDTreeFind
    endif
    :echo "nerdtree refrech"
  else
    :NERDTreeFind
  endif
endfunction

" silent! nmap <F9> :<CR>
" silent! nmap <F10> :<CR>
imap <F11> <Esc> <CR>
let g:user_emmet_expandabbr_key='<F8>'
" imap <expr> <F2> emmet#expandAbbrIntelligent("\<F2>")
map <C-d> :tabn<cr>
map <C-A-d> :tabp<cr>
let g:airline_theme='base16_default'
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
" List ends here. Plugins become visible to Vim after this call.
"
"

let g:colorscheme = "darkblue"


" bootstrap config
let g:vim_bootstrap_langs = "html,javascript,php,typescript,blade"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim
let g:vim_bootstrap_theme = "dracula"
let g:vim_bootstrap_frams = "vuejs"


"_________________ fzf _______________________

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" _________________ fzf _________________
"






source $HOME/.config/nvim/plug-config/coc.vim
call plug#end()
