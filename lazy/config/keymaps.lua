-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map Esc to jk
map("i", "jk", "<Esc>")

-- remap Y to yank a line
map("n", "Y", "yy")

map(
  "n",
  "<leader><F9>",
  "<cmd>IndentBlanklineToggle<CR> <cmd>Gitsigns toggle_signs<CR> <cmd>set number! relativenumber! list!<CR>"
)
-- map("n", "<leader>tg", "<cmd>Gitsigns toggle_signs<CR>")

-- background transparent or non-transparent
map("n", "<leader>bt", "<cmd>hi Normal guibg=NONE<CR>")
map("n", "<leader>nbt", "<cmd>hi Normal guibg=#222436<CR>")
