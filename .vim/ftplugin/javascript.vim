if findfile('.eslintrc', '.;') != '' || findfile('.eslintrc.json', '.;') != '' || findfile('.eslintrc.js', '.;') != ''
    let b:syntastic_checkers = ['eslint']
    let b:syntastic_javascript_eslint_exec =
        \ split(system('PATH=$(npm bin):$PATH which eslint_d eslint'), '\n')[0]
endif
