" Vim compiler file
" Compiler: Maven
" Maintainer: Dan Taylor <dan@danielgranttaylor.com>
" Last Change: 2014 Oct 06

if exists("current_compiler")
    finish
endif

if exists(":CompielrSet") != 2 " older Vim always used :setlocal
    command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn

" POM related messages
CompilerSet errorformat=%E[ERROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,%Z,
CompilerSet errorformat+=%+E[ERROR]\ %#Malformed\ POM\ %f:%m\ %#\\@\ %.%#\\,\ line\ %l\\,\ column\ %c%.%#,%Z,
" Java related build messages
CompilerSet errorformat+=%+I[INFO]\ BUILD\ %m,%Z
CompilerSet errorformat+=%E[ERROR]\ %f:[%l\\,%c]\ %m,%Z

" jUnit related build messages
CompilerSet errorformat+=%+E\ \ %#test%m,%Z
CompilerSet errorformat+=%-G%.%#,%Z
CompilerSet errorformat+=%-G\Z%\\(%^%$%\\)
