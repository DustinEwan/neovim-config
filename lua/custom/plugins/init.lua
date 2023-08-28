-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.cmd('set relativenumber')
vim.cmd('let &stc=\'%s %(%l%) %=%(%r%) \'')
vim.cmd('set signcolumn=yes')

return {
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    'christoomey/vim-tmux-navigator',
    'theprimeagen/harpoon',
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }
}
