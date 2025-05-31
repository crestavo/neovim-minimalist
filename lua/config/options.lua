-- OPTIONS
local set = vim.opt
local home = os.getenv("HOME") or os.getenv("USERPROFILE")

vim.opt.winbar = "%=%m %f"

vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.title = true

--line nums
set.relativenumber = true
set.number = true

-- indentation and tabs
set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- cursor line
set.cursorline = true

-- clipboard
set.clipboard:append("unnamedplus")

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- dw/diw/ciw works on full-word
set.iskeyword:append("-")

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 10

-- undo dir settings
set.swapfile = false
set.backup = false
set.undodir = home .. "/.vim/undodir"
set.undofile = true

-- incremental search
set.incsearch = true

-- faster cursor hold
set.updatetime = 50
