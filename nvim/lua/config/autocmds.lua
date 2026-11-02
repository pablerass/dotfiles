local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("dotfiles", { clear = true })

vim.filetype.add({
    extension = {
        -- Treat .hcl files as terraform
        hcl = "terraform",
    },
})

-- Indent with 2 spaces
autocmd("FileType", {
    group = group,
    pattern = { "yaml", "xml", "css", "sls", "terraform", "cucumber", "json", "lua" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- Force tabs instead of spaces
autocmd("FileType", {
    group = group,
    pattern = { "go", "make" },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Disable unwanted autoindent behaviors
autocmd("FileType", {
    group = group,
    pattern = { "python", "yaml" },
    callback = function()
        vim.opt_local.cindent = false
        vim.opt_local.smartindent = false
        vim.opt_local.indentexpr = ""
    end,
})

-- Text documents: spell checking and wrapping
autocmd("FileType", {
    group = group,
    pattern = { "markdown", "rst" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.textwidth = 119
    end,
})

-- Do not mark overlength in csv files
autocmd("FileType", {
    group = group,
    pattern = { "csv", "tsv" },
    callback = function()
        vim.opt_local.colorcolumn = ""
    end,
})

-- Briefly highlight yanked text
autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Reload files changed outside nvim (e.g. edited by Claude Code)
vim.opt.autoread = true
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    group = group,
    command = "silent! checktime",
})
