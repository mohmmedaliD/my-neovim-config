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
silent! nmap <F6> :setfiletype vue<CR>
silent! nmap <F7> :setfiletype css<CR>
" silent! nmap <F9> :<CR>
" silent! nmap <F10> :<CR>
imap <F11> <Esc> <CR>
let g:user_emmet_expandabbr_key='+'
" imap <expr> <F2> emmet#expandAbbrIntelligent("\<F2>")
map <C-s> :tabn<cr>
let g:airline_theme='base16_default'
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
" List ends here. Plugins become visible to Vim after this call.
"
"
source $HOME/.config/nvim/plug-config/coc.vim
call plug#end()
