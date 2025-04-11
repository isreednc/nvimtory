vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true 

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 5)
end)


local function is_terminal_window()
  local bufnr = vim.api.nvim_get_current_buf()
  return vim.bo[bufnr].buftype == 'terminal'
end

local function toggle_terminal()
  if is_terminal_window() then
    -- Close the current terminal window
    vim.api.nvim_win_close(0, true)
    return
  end

  -- Search for an existing terminal window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  -- Search for an existing terminal buffer (not currently shown)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      vim.cmd.vsplit() -- open a vertical split
      vim.api.nvim_set_current_buf(buf)
      vim.cmd.wincmd("J")
      vim.api.nvim_win_set_height(0, 5)
      return
    end
  end

  -- If no terminal buffer exists, create a new one
  vim.cmd.vsplit()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end

vim.keymap.set('n', '<leader>tt', toggle_terminal, { desc = "Toggle Terminal" })


-- Telescope nvim config from anywhere --
vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").find_files({
    prompt_title = "Neovim Config",
    cwd = vim.fn.stdpath("config"),
  })
end, { desc = "Telescope find in Neovim config" })

