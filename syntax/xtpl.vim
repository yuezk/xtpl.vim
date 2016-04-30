" Read the HTML syntax to start with
if version < 600
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Standard HiLink will not work with included syntax files
if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

" 定义 XTemplate 的 {{ }} 区块
syn region xtplNormalInside matchgroup=xtplBraces start=/\({\)\@<!{{\([{!%]\)\@!\~\?/ end=/\~\?\([%}]\)\@<!}}\(}\)\@!/ containedin=ALLBUT,@xtplInside
" 定义 XTemplate 的 {{{ }}} 区块
syn region xtplUnescapeInside matchgroup=xtplBracesUnescape start=/\({\)\@<!{{{\({\)\@!/ end=/\(}\)\@<!}}}\(}\)\@!/ containedin=ALLBUT,@xtplInside

" 定义 {{% %}} 区块
syn region xtplRawInside matchgroup=xtplBracesRaw start=/\({\)\@<!{{%/ end=/%}}\(}\)\@!/ containedin=ALLBUT,@xtplInside

" 注释的区块 {{! }}
syn region xtplComment start=/{{!/rs=s+2 skip=/{{.\{-}}}/ end=/}}/re=e-2 contains=xtplTodo containedin=TOP keepend

" todo 关键字高亮
syn keyword xtplTodo TODO contained 

syn cluster xtplInside add=xtplNormalInside,xtplUnescapeInside

" 操作符
syn match xtplOperators '[-+*/=.><%,]' contained containedin=@xtplInside

" 数字
syn match xtplNumber '\d' contained containedin=@xtplInside

" else 和 elseif
syn match xtplConditionals /else\(if\)\=/ contained containedin=@xtplInside

" 命令
syn match xtplCommand '[/#]\s*\(if\|with\|each\|block\|macro\)' contained containedin=@xtplInside

" 关键字
syn keyword xtplKeyword contained this xindex null undefined debugger extend include includeOnce macro parse range require block set use void seed containedin=@xtplInside

" 单引号字符串
syn region xtplQString start=/'/ skip=/\\'/ end=/'/ contained containedin=@xtplInside

" 双引号字符串
syn region xtplDQString start=/"/ skip=/\\"/ end=/"/ contained containedin=@xtplInside

" 大括号部分高亮
" {{ }}
HtmlHiLink xtplBraces Special
" {{{ }}}
HtmlHiLink xtplBracesUnescape Identifier
" {{% %}}
HtmlHiLink xtplBracesRaw Identifier

" 注释高亮
HtmlHiLink xtplComment Comment
" todo 关键字样式
HtmlHiLink xtplTodo Todo

" 关键字高亮
HtmlHiLink xtplKeyword Identifier
" 操作符高亮
HtmlHiLink xtplOperators Operator
" 数字高亮
HtmlHiLink xtplNumber Number

" esle 和 elseif 高亮
HtmlHiLink xtplConditionals Conditional
" 命令高亮
HtmlHiLink xtplCommand Keyword

" 单引号字符串
HtmlHiLink xtplQString String
" 双引号字符串
HtmlHiLink xtplDQString String

let b:current_syntax = "xtpl"
delcommand HtmlHiLink
