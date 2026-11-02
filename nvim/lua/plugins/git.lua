return {
    { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "GBrowse" } },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(buf)
                local gs = require("gitsigns")
                local function map(mode, keys, func, desc)
                    vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc })
                end
                map("n", "]c", function() gs.nav_hunk("next") end, "Next hunk")
                map("n", "[c", function() gs.nav_hunk("prev") end, "Previous hunk")
                map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>gb", gs.blame_line, "Blame line")
            end,
        },
    },
}
