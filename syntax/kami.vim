if exists("b:current_syntax")
	finish
endif

if !exists("main_syntax")
	let main_syntax="kami"
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn match kamiAttr '{[^}]*}' 
syn region kamiHeader oneline start=/^\#\{1,6}/ end=/$/ contains=kamiAttr
syn region kamiBold oneline start=/\*\{1,2}[^ ]/ end=/\*\{1,2}/ contains=kamiBI
syn region kamiIB oneline start=/\*\{1,2}[^ ]/ end=/\*\{1,2}/
syn region kamiItalic oneline start=/_\{1,2}[^ ]/ end=/_\{1,2}/ contains=kamiIB
syn region kamiBI oneline start=/_\{1,2}[^ ]/ end=/_\{1,2}/
syn region kamiStrike oneline start=/-\{1}[^ ]/ end=/-\{1}/
syn region kamiUnderline oneline start=/-\{2}[^ ]/ end=/-\{2}/
syn region kamiCode oneline start=/`\{1}/ end=/`\{1}/
syn match kamiLink '\[\([^]]\|\(\\\]\)\)*\](\([^)]\|\(\\)\)\)*)'

hi link kamiBold htmlBold
hi link kamiItalic htmlItalic
hi link kamiBI htmlBoldItalic
hi link kamiIB htmlBoldItalic
hi link kamiAttr Identifier
hi link kamiHeader htmlH1
hi link kamiCode Delimiter
hi link kamiStrike htmlStrike
hi link kamiUnderline htmlUnderline

hi def kamiBold term=bold cterm=bold gui=bold
hi def kamiItalic term=italic cterm=italic gui=italic
hi def kamiLink term=underline cterm=underline gui=underline
