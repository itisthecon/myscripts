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

-- Change leader to a comma
vg.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- misc ----------------------- {{{

-- Map Esc to jk
map("i", "jk", "<Esc>")

-- remap Y to yank a line
map("n", "Y", "yy")

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- }}}

-- fold related ----------------------- {{{

-- 用空格键来开关折叠
-- zr decreases the foldlevel by one.
-- zm increases the foldlevel by one.
-- zO opens all folds at the cursor.
map("n", "<space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>")

-- }}}

-- paste related ----------------------- {{{

-- 拷贝模式切换(关闭缩进参考线和行号, 也关闭signify的git diff指示符)
map(
	"n",
	"<F9>",
	"<cmd>IndentBlanklineToggle<CR> <cmd>set number! relativenumber!<CR> :call ToggleSignColumn()<CR> <cmd>SignifyToggle<CR>"
)

-- paste selected content
map("n", "<leader>p", '"*p')
map("v", "<leader>p", '"*p')
-- Paste from clipboard
map("n", "<leader>P", '"+p')
map("v", "<leader>P", '"+p')

-- Toggle auto-indenting for code paste
map("n", "<F3>", ":set invpaste paste?<CR>")
vim.opt.pastetoggle = "<F3>"

-- }}}

-- splite window related ----------------------- {{{

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical
-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- }}}

-- UI related ----------------------- {{{

map("n", "<leader>tt", ":call v:lua.theme_toggle()<cr>")

-- }}}
