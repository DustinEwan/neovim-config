-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "simrat39/rust-tools.nvim",
    },
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    'theprimeagen/harpoon',
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        config = function()
            vim.cmd('colorscheme rose-pine-moon')
        end
    }
}
