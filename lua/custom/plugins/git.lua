GitPushAutoUpstream = function()
  local branch = vim.api.nvim_command("!git branch --show-current")
  local push_cmd = "git push --set-upstream origin " .. branch
  local conf_message = "Are you sure you want to execute\n" .. push_cmd
  vim.ui.select({ "Yes", "No" }, { prompt = conf_message }, function(choice)
    if choice == "Yes" then
      vim.api.nvim_command("!" .. push_cmd)
    else
      vim.cmd([[last]])
    end
  end)
end

vim.keymap.set("n", "<leader>gP", GitPushAutoUpstream, { desc = "[G]it [P]ush" })

return {
  'tpope/vim-fugitive'
}
