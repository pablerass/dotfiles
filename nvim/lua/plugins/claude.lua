-- Claude Code integration. It implements the same protocol as the VS Code extension, so
-- Claude sees the current file and selection, and proposed edits are shown as nvim diffs.
-- It also works with claude running in another terminal or tmux pane: run /ide inside it.
return {
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        -- Start the server on startup, so an external claude can connect with /ide
        event = "VeryLazy",
        opts = {
            terminal = {
                split_side = "right",
                split_width_percentage = 0.4,
            },
        },
        keys = {
            { "<leader>ac", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
            { "<leader>af", "<cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
            { "<leader>ar", "<cmd>ClaudeCode --resume<CR>", desc = "Resume Claude session" },
            { "<leader>aC", "<cmd>ClaudeCode --continue<CR>", desc = "Continue last Claude session" },
            { "<leader>am", "<cmd>ClaudeCodeSelectModel<CR>", desc = "Select Claude model" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<CR>", desc = "Add current buffer to Claude" },
            { "<leader>as", "<cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send selection to Claude" },
            { "<leader>as", "<cmd>ClaudeCodeTreeAdd<CR>", desc = "Add file to Claude", ft = { "snacks_picker_list" } },
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept Claude diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", desc = "Deny Claude diff" },
        },
    },
}
