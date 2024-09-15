-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.cmd('set relativenumber')
vim.cmd('let &stc=\'%s %(%l%) %=%(%r%) \'')
vim.cmd('set signcolumn=yes')

require("noice").setup({
    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = false, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
    }
})

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
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {

            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    }
}
