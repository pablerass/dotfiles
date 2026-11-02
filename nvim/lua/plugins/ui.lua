return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = { enabled = true },
            picker = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            terminal = { enabled = true },
        },
        keys = {
            { "<F2>", function() Snacks.explorer() end, desc = "Toggle file explorer" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
            { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
            { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = { theme = "powerline_dark" },
            -- List of buffers at the top, as vim-airline tabline
            tabline = { lualine_a = { { "buffers", show_filename_only = true } } },
        },
    },
    {
        -- Code outline, replaces tagbar
        "stevearc/aerial.nvim",
        opts = {},
        keys = {
            { "<F8>", "<cmd>AerialToggle!<CR>", desc = "Toggle outline" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>a", group = "Claude Code" },
                { "<leader>b", group = "Buffers" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
            },
        },
    },
}
