if findfile('.eslintrc', '.;') != ''
    let b:syntastic_checkers = ['eslint']
endif
