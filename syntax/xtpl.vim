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

" Clustering
syntax cluster htmlXtplContainer add=htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlLink,htmlBold,htmlUnderline,htmlItalic,htmlValue

" 定义 XTemplate 的 {{ }} 区块
syn region xtplInside start=/{{/ end=/}}}\?/ keepend containedin=TOP,@htmlXtplContainer

" 操作符
syn match xtplOperators '[-+*/=.><%,]' contained containedin=xtplInside

" 数字
syn match xtplNumber '\d' contained containedin=xtplInside

" 大括号
syn match xtplBraces '{{\|}}' contained containedin=xtplInside,@htmlXtplContainer

" 不进行转义的大括号
syn match xtplBracesUnescape '{{{\|}}}' contained containedin=xtplInside,@htmlXtplContainer

" {{% 和 %}}
syn match xtplBracesRaw '{{%\|%}}' contained containedin=xtplInside,@htmlXtplContainer

" else 和 elseif
syn match xtplConditionals 'else\(if\)\=' contained containedin=xtplInside

" 命令
syn match xtplCommand '[/#]\s*\(if\|with\|each\|block\|macro\)' contained containedin=xtplInside

" 关键字
syn keyword xtplKeyword contained this xindex debugger extend include includeOnce macro parse range require block set use void containedin=xtplInside

" 注释的样式
syn region xtplComment start=/{{!/rs=s+2 skip=/{{.\{-}}}/ end=/}}/re=e-2 contains=Todo contained containedin=xtplInside,@htmlXtplContainer

" 单引号
syn region xtplQString start=/'/ skip=/\\'/ end=/'/ contained containedin=xtplInside

" 双引号
syn region xtplDQString start=/"/ skip=/\\"/ end=/"/ contained containedin=xtplInside

" 关键字高亮
HtmlHiLink xtplKeyword Identifier

" 大括号高亮
HtmlHiLink xtplBraces Special
HtmlHiLink xtplBracesUnescape Identifier
HtmlHiLink xtplBracesRaw Identifier

HtmlHiLink xtplOperators Operator
HtmlHiLink xtplNumber Number
HtmlHiLink xtplConditionals Conditional
HtmlHiLink xtplCommand Keyword

" 注释高亮
HtmlHiLink xtplComment Comment

HtmlHiLink xtplQString String
HtmlHiLink xtplDQString String

let b:current_syntax = "xtpl"
delcommand HtmlHiLink
