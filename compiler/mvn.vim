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

" Catch POM specific errors.
CompilerSet errorformat=%+E[%tRROR]\ %#Malformed\ POM\ %f:\ %m@%l:%c%.%#,
CompilerSet errorformat+=%+E[%tRROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,
CompilerSet errorformat+=%+E[%tRROR]\ %#Exit\ code:\ %n\ -\ %f:%l:\ %m,

" Capture & display any errors executing plugin goals
CompilerSet errorformat+=%+A[%t%[A-Z]%#]\ %#Failed\ to\ execute\ goal%.%#,

" Capture & display build success information
CompilerSet errorformat+=%+I[%t%[A-Z]%#]\ %#BUILD\ %.%#,

" Catch any error / warning / info in a specific file at a specific
" line/column pair.
CompilerSet errorformat+=%A[%t%[A-Z]%#]\ %f:[%l\\,%c]\ %m
CompilerSet errorformat+=%A%f:[%l\\,%c]\ %m,

" Catch module build status
CompilerSet errorformat+=%G[INFO]\ %s%[A-Z\ ]%#\ %#..%#\ %m,

" Toss the rest
CompilerSet errorformat+=%-G%.%#,
