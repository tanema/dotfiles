" Vim syntax file
" Language: Squirt
" URL: https://github.com/tanema/squirt/extras/squirt.vim
if exists("b:current_syntax")
  finish
endif

syntax sync fromstart

" Clusters
syntax cluster squirtBase contains=squirtComment,squirtCommentLong,squirtConstant,squirtNumber,squirtString,squirtStringLong,squirtBuiltIn
syntax cluster squirtExpr contains=@squirtBase,squirtTable,squirtParen,squirtBracket,squirtSpecialValue,squirtOperator,squirtSymbolOperator,squirtEllipsis,squirtComma,squirtFunc,squirtFuncCall,squirtError
syntax cluster squirtStat contains=@squirtExpr,squirtIfThen,squirtBlock,squirtLoop,squirtClass,squirtStatement,squirtSemiCol,squirtErrHand
syntax match squirtNoise /\%(\.\|,\|:\|\;\)/

" Symbols
syntax region squirtTable transparent matchgroup=squirtBraces start="{" end="}" contains=@squirtExpr fold
syntax region squirtParen   transparent matchgroup=squirtParens   start='(' end=')' contains=@squirtExpr
syntax region squirtBracket transparent matchgroup=squirtBrackets start="\[" end="\]" contains=@squirtExpr
syntax match  squirtComma ","
syntax match  squirtSemiCol ";"
syntax match  squirtSymbolOperator "[!#<>=~^&|*/%+-]"
syntax match  squirtEllipsis "\.\.\."

" Catch errors caused by unbalanced brackets and keywords
syntax match squirtError ")"
syntax match squirtError "}"
syntax match squirtError "\]"
syntax match squirtError "\<\%(end\|else\|elseif\|then\|until\)\>"

" Comments
syntax match squirtComment "\%^#!.*"
syntax keyword squirtCommentTodo contained TODO FIXME XXX TBD
syntax match   squirtComment "//.*$" contains=squirtCommentTodo,Spell
syntax region  squirtCommentLong matchgroup=squirtCommentLongTag start="/\*" end="\*/" contains=squirtCommentTodo,Spell fold

" Function calls
syntax match squirtFuncCall /\k\+\%(\s*[{('"]\)\@=/

" Functions
syntax region squirtFunc transparent matchgroup=squirtFuncKeyword start="\<func\>" end="\<end\>" contains=@squirtStat,squirtFuncSig fold
syntax region squirtFuncSig contained transparent start="\(\<func\>\)\@<=" end=")" contains=squirtFuncId,squirtFuncArgs keepend
syntax match squirtFuncId contained "[^(]*(\@=" contains=squirtFuncTable,squirtFuncName
syntax match squirtFuncTable contained /\k\+\%(\s*[.:]\)\@=/
syntax match squirtFuncName contained "[^(.]*(\@="
syntax region squirtFuncArgs contained transparent matchgroup=squirtFuncParens start=/(/ end=/)/ contains=@squirtBase,squirtFuncArgName,squirtFuncArgComma,squirtEllipsis
syntax match squirtFuncArgName contained /\k\+/
syntax match squirtFuncArgComma contained /,/

" if then else
syntax region squirtIfThen transparent matchgroup=squirtCond start="\<if\>" end="\<then\>"me=e-4 contains=@squirtExpr nextgroup=squirtThenEnd skipwhite skipempty
syntax region squirtThenEnd contained transparent matchgroup=squirtCond start="\<then\>" end="\<end\>" contains=@squirtStat,squirtElseifThen,squirtElse fold
syntax region squirtElseifThen contained transparent matchgroup=squirtCond start="\<elseif\>" end="\<then\>" contains=@squirtExpr
syntax keyword squirtElse contained else

" loops
syntax region squirtLoopBlock transparent matchgroup=squirtRepeat start="\<do\>" end="\<end\>" contains=@squirtStat contained fold
syntax region squirtBlock transparent matchgroup=squirtStatement start="\<do\>" end="\<end\>" contains=@squirtStat fold
syntax region squirtLoop transparent matchgroup=squirtRepeat start="\<repeat\>" end="\<until\>" contains=@squirtStat nextgroup=@squirtExpr fold
syntax region squirtLoop transparent matchgroup=squirtRepeat start="\<while\>" end="\<do\>"me=e-2 contains=@squirtExpr nextgroup=squirtLoopBlock skipwhite skipempty
syntax region squirtLoop transparent matchgroup=squirtRepeat start="\<for\>" end="\<do\>"me=e-2 contains=@squirtExpr,squirtIn nextgroup=squirtLoopBlock skipwhite skipempty
syntax keyword squirtIn contained in

" class
syntax region squirtClass transparent matchgroup=squirtRepeat start="\<class\>" end="\<do\>"me=e-2 contains=@squirtStat,squirtIsa nextgroup=squirtBlock skipwhite skipempty
syntax keyword squirtIsa contained isa

" Other Keywords
syntax keyword squirtConstant nil true false
syntax keyword squirtBuiltIn _ENV self property
syntax keyword squirtOperator and or not
syntax keyword squirtStatement break return next

" Strings
syntax match  squirtStringSpecial contained #\\[\\abfnrtvz'"]\|\\x[[:xdigit:]]\{2}\|\\[[:digit:]]\{,3}#
syntax region squirtStringLong matchgroup=squirtStringLongTag start="`" end="`" contains=@Spell fold
syntax region squirtString  start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=squirtStringSpecial,@Spell
syntax region squirtString  start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=squirtStringSpecial,@Spell

" Decimal constant
syntax match squirtNumber "\<\d\+\>"
" Hex constant
syntax match squirtNumber "\<0[xX][[:xdigit:].]\+\%([pP][-+]\=\d\+\)\=\>"
" Floating point constant, with dot, optional exponent
syntax match squirtFloat  "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, starting with a dot, optional exponent
syntax match squirtFloat  "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, without dot, with exponent
syntax match squirtFloat  "\<\d\+[eE][-+]\=\d\+\>"

" Special names from the Standard Library
syntax keyword squirtErrHand spill clean
syntax keyword squirtSpecialValue require tostring tonumber typeof print new delete

hi def link squirtParens           Noise
hi def link squirtBraces           Structure
hi def link squirtBrackets         Noise
hi def link squirtBuiltIn          Special
hi def link squirtComment          Comment
hi def link squirtCommentLongTag   squirtCommentLong
hi def link squirtCommentLong      squirtComment
hi def link squirtCommentTodo      Todo
hi def link squirtCond             Conditional
hi def link squirtConstant         Constant
hi def link squirtEllipsis         Special
hi def link squirtElse             Conditional
hi def link squirtError            Error
hi def link squirtFloat            Float
hi def link squirtFuncArgName      Noise
hi def link squirtFuncCall         PreProc
hi def link squirtFuncId           Function
hi def link squirtFuncName         squirtFuncId
hi def link squirtFuncTable        squirtFuncId
hi def link squirtFuncKeyword      squirtFunction
hi def link squirtFunction         Structure
hi def link squirtFuncParens       Noise
hi def link squirtIn               Repeat
hi def link squirtIsa              Repeat
hi def link squirtNumber           Number
hi def link squirtSymbolOperator   squirtOperator
hi def link squirtOperator         Operator
hi def link squirtRepeat           Repeat
hi def link squirtSemiCol          Delimiter
hi def link squirtSpecialValue     PreProc
hi def link squirtStatement        Statement
hi def link squirtString           String
hi def link squirtStringLong       squirtString
hi def link squirtStringSpecial    SpecialChar
hi def link squirtErrHand          Exception

let b:current_syntax = "squirt"

