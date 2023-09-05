local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end


return {
    {
        'rust-lang/rust.vim',
        ft = 'rust',
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    'qnighy/lalrpop.vim',
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        opts = {
            server = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        assist = {
                            importEnforceGranularity = true,
                            importPrefix = 'crate',
                        },
                        checkOnSave = {
                            command = 'clippy',
                        },
                        -- inlayHints = { locationLinks = false },
                        diagnostics = {
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                    }
                }
            }
        },
        dependencies = {
            'neovim/nvim-lspconfig',
        },
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                }
            })
        end,
        keys = {
            { 'K',          '<cmd>Lspsaga hover_doc<cr>',   desc = 'LSPSaga Hover Documentation' },
            { '<leader>ca', '<cmd>Lspsaga code_action<cr>', desc = 'LSPSaga [C]ode [A]ctions' },
            { '<leader>oi',        organize_imports,               desc = '[O]rganize [I]mports' },
        },
        build = ':TSInstall markdown markdown_inline',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'      -- optional
        }
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- Opt to list sources here, when available in mason.
                },
                automatic_installation = false,
                handlers = {},
            })
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            require("null-ls").setup({
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                                -- vim.lsp.buf.formatting_sync()
                            end,
                        })
                    end
                end,
            })
        end
    },
    {
        "danymat/neogen",
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
        },
        config = true,
        event = "LspAttach",
        keys = {
            { '<leader>cd',         function () require('neogen').generate() end,               desc = '[C]ode [D]ocgen' },
        },
    }
}
