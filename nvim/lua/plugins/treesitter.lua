local languages = {
    "bash", "css", "csv", "dockerfile", "go", "hcl", "html", "javascript", "jinja", "json",
    "lua", "make", "markdown", "markdown_inline", "python", "query", "sql", "terraform",
    "toml", "typescript", "vim", "vimdoc", "xml", "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Parsers are compiled with tree-sitter-cli, installed by mason. Missing ones are
            -- installed in the background on interactive sessions and with :TSInstallAll on scripts
            local has_cli = vim.fn.executable("tree-sitter") == 1
            if has_cli and #vim.api.nvim_list_uis() > 0 then
                require("nvim-treesitter").install(languages)
            end
            vim.api.nvim_create_user_command("TSInstallAll", function()
                require("nvim-treesitter").install(languages):wait(600000)
            end, { desc = "Install all configured treesitter parsers and wait" })

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("dotfiles-treesitter", { clear = true }),
                callback = function(ev)
                    pcall(vim.treesitter.start, ev.buf)
                end,
            })
        end,
    },
}
