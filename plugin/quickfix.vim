" Quickfix sort and entity stripping function
" Based off of script found at:
" http://vim.wikia.com/wiki/Automatically_sort_Quickfix_list
"
function! s:OrderQListEntries(item1, item2)
    if bufname(a:item1.bufnr) == bufname(a:item2.bufnr)
        if a:item1.lnum == a:item2.lnum
            return 0
        elseif a:item1.lnum < a:item2.lnum
            return -1
        else
            return 1
        endif
    elseif bufname(a:item1.bufnr) < bufname(a:item2.bufnr)
        return -1
    else
        return 1
    endif
endfunction

function! s:StripNonErrorAndDuplicateEntries()
    let qlist = sort(getqflist(), 's:OrderQListEntries')
    let finalList = []
    let previousBufferIdentifier = ''
    for item in qlist
        if item.text !=# ''
            let thisBufferIdentifier = bufname(item.bufnr) . ":" . item.lnum
            if thisBufferIdentifier !=# previousBufferIdentifier
                call add(finalList, item)
                let previousBufferIdentifier = thisBufferIdentifier
            endif
        endif
    endfor
    call setqflist(finalList)
endfunction

autocmd! QuickfixCmdPost * call s:StripNonErrorAndDuplicateEntries()
