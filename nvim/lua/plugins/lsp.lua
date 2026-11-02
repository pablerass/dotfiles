-- Language servers and tools installed through mason
local tools = {
    "basedpyright",
    "ruff",
    "bash-language-server",
    "shellcheck",
    "yaml-language-server",
    "json-lsp",
    "terraform-ls",
    "lua-language-server",
    "tree-sitter-cli",
}
local servers = { "basedpyright", "ruff", "bashls", "yamlls", "jsonls", "terraformls", "lua_ls" }

if vim.fn.executable("go") == 1 then
    table.insert(tools, "gopls")
    table.insert(servers, "gopls")
end

-- Find the Python interpreter for a project, in order:
--   1. .venv/venv inside the project (uv, poetry with in-project venvs, python -m venv)
--   2. The activated virtualenv ($VIRTUAL_ENV)
--   3. A virtualenvwrapper env named as the project ($WORKON_HOME/<project>)
--   4. The system python3
local function python_path(root_dir)
    if root_dir then
        for _, venv in ipairs({ ".venv", "venv" }) do
            local python = vim.fs.joinpath(root_dir, venv, "bin", "python")
            if vim.uv.fs_stat(python) then
                return python
            end
        end
    end
    if vim.env.VIRTUAL_ENV then
        return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
    end
    if root_dir then
        local workon_home = vim.env.WORKON_HOME or vim.fs.joinpath(vim.env.HOME, ".virtualenvs")
        local python = vim.fs.joinpath(workon_home, vim.fs.basename(root_dir), "bin", "python")
        if vim.uv.fs_stat(python) then
            return python
        end
    end
    return vim.fn.exepath("python3")
end

return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = { ensure_installed = tools },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim", "saghen/blink.cmp" },
        config = function()
            vim.lsp.config("basedpyright", {
                before_init = function(_, config)
                    config.settings.python = config.settings.python or {}
                    config.settings.python.pythonPath = python_path(config.root_dir)
                end,
                settings = {
                    basedpyright = {
                        -- Imports are organized by ruff
                        disableOrganizeImports = true,
                        analysis = {
                            typeCheckingMode = "standard",
                        },
                    },
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
                    },
                },
            })

            vim.lsp.enable(servers)

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("dotfiles-lsp", { clear = true }),
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    -- Hover is provided by basedpyright
                    if client and client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end

                    -- Nvim already maps K (hover), grn (rename), gra (code action), grr (references),
                    -- gri (implementation), gO (symbols), [d ]d (diagnostics) and <C-s> (signature)
                    local function map(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
                    map("<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")
                    map("<leader>lr", "<cmd>lsp restart<CR>", "Restart language servers")
                end,
            })
        end,
    },
}
