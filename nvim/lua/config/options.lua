local opt = vim.opt

-- Use the OS clipboard by default
opt.clipboard = "unnamed"
-- Persist undo history (stored in ~/.local/state/nvim/undo)
opt.undofile = true
-- Add the g flag to search/replace by default
opt.gdefault = true
-- Do not add a newline at the end of files that do not have one
opt.fixendofline = false
-- Disable modelines
opt.modeline = false
-- Enable per-directory .nvim.lua/.nvimrc/.exrc files (asks to trust them first)
opt.exrc = true
-- Line numbers
opt.number = true
opt.relativenumber = true
-- Disable line wrapping
opt.wrap = false
-- Highlight current line
opt.cursorline = true
-- Make tabs as wide as four spaces and convert them to spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- Show "invisible" characters
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", eol = "¬", nbsp = "_" }
-- Searches
opt.ignorecase = true
opt.smartcase = true
-- Enable mouse in all modes
opt.mouse = "a"
-- Do not reset cursor to start of line when moving around
opt.startofline = false
-- Do not show the intro message
opt.shortmess:append("atI")
-- Show the filename in the window titlebar
opt.title = true
-- Start scrolling five lines before the window border
opt.scrolloff = 5
-- Allow hidden modified buffers
opt.hidden = true
-- Mark overlength lines
opt.colorcolumn = "120"
-- Always show the sign column to avoid text shifting with git/diagnostic signs
opt.signcolumn = "yes"
opt.termguicolors = true
opt.updatetime = 300
opt.splitright = true
opt.splitbelow = true

-- Diagnostics shown inline and in the sign column
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = { border = "rounded", source = true },
})
