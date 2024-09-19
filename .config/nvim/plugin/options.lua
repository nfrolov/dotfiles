vim.opt.mouse = ''
vim.opt.guicursor = ''
vim.opt.belloff = ''

vim.opt.undofile = true
vim.opt.updatetime = 300

vim.opt.title = true
vim.opt.shortmess = 'aF'
vim.opt.showmode = false

vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.list = true
vim.opt.listchars = { tab = '»·', trail = '·', extends = '>', precedes = '<', nbsp = '+' }
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = { 'shift:-2' }
vim.opt.showbreak = '↪ '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = { 120, 140 }
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumblend = 10
vim.opt.pumheight = 16
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.opt.wildmode = { 'longest:full', 'full' }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'
