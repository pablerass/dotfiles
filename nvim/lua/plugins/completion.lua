return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            -- <C-space> open menu, <C-y> accept, <C-n>/<C-p> select, <C-e> close
            keymap = { preset = "default" },
            completion = {
                -- Do not open the completion menu just by typing a dot
                trigger = { show_on_trigger_character = false },
                documentation = { auto_show = true },
            },
            signature = { enabled = true },
            sources = { default = { "lsp", "path", "buffer" } },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
}
