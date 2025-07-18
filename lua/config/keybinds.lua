-- KEYBINDS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")       -- Remap joining lines
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")       -- center screen when looping search results
vim.keymap.set("n", "N", "Nzzzv")

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- sometimes in insert mode, control-c doesn't exactly work like escape
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- What the heck is Ex mode?
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- getting Alex off my back :)
vim.keymap.set("n", "<leader>dg", "<cmd>DogeGenerate<cr>")

-- lint / format php files for LC
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")

-- Replace all instances of whatever is under cursor (on line)
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- yank into clipboard even if on ssh
vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator")
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")

-- reload without exiting vim
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- source file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Set leader key ke <Space>
vim.g.mapleader = " "

-- Split horizontal dan vertical
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

-- Navigasi antar split
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-Down>", ":resize -5<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +5<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>")

-- Menutup window aktif
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Toggle diagnostic
local diagnostics_active = true
-- function toggle diagnostic
local function toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  end
end
-- Keymap toggle
vim.keymap.set("n", "<leader>ud", toggle_diagnostics, { noremap = true, silent = true })
