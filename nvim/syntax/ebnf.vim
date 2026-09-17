" ebnf.vim - Syntax highlighting for EBNF
" Author: Chubak Bidpaa (chubakbidpaa@riseup.net)

if exists("b:current_syntax")
  finish
endif

syntax region ebnfComment start=/\v#\s+/ end=/\v$/
syntax region ebnfMultiCharTerminal start=/\v"/ end=/\v"/
syntax region ebnfSingleCharTerminal start=/\v'/ end=/\v'/

syntax match ebnfSubsection /\v\+?[a-zA-Z0-9_-]+(::[a-zA-Z0-9_-]+)+/

syntax match ebnfNonTermIdent /\v[-_a-z0-9]+/
syntax match ebnfLhsIdent /\v^[-_a-z0-9]+/

syntax match ebnfOperator "::="
syntax match ebnfOperator "{"
syntax match ebnfOperator "}"
syntax match ebnfOperator "\["
syntax match ebnfOperator "]"
syntax match ebnfOperator "("
syntax match ebnfOperator ")"
syntax match ebnfOperator "/"
syntax match ebnfOperator "|"
syntax match ebnfOperator "\.\.\."
syntax match ebnfRegexOperator "?"
syntax match ebnfRegexOperator "*"
syntax match ebnfRegexOperator "+"
 
highlight link ebnfComment Comment
highlight link ebnfMultiCharTerminal String
highlight link ebnfSingleCharTerminal Character
highlight link ebnfNonTermIdent Identifier
highlight link ebnfLhsIdent Underlined
highlight link ebnfOperator Operator
highlight link ebnfRegexOperator Type
highlight link ebnfSubsection Keyword

let b:current_syntax = "ebnf"
