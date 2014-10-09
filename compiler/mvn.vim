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
CompilerSet errorformat=[%tRROR]\ %#Malformed\ POM\ %f:\ %m@%l:%c%.%#,
CompilerSet errorformat+=[%tRROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,

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
CompilerSet errorformat+=%-G[%t%[A-Z]%#]\ %#-%#%m,
CompilerSet errorformat+=%-G\ %#-%#,
CompilerSet errorformat+=%-Z[%[A-Z]%#]\ %#-%#%.%#,
CompilerSet errorformat+=%-Z[%[A-Z]%#]\ %#-\>%.%#,
CompilerSet errorformat+=%-Z[%[A-Z]%#]\ %#%[0-9]%#\ error%.%#,
CompilerSet errorformat+=%C[%t%[A-Z]%#]\ %#%m,
CompilerSet errorformat+=%-G[%t%[A-Z]%#]\ %#%m,

