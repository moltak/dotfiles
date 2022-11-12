" https://github.com/akinsho/toggleterm.nvim
lua << EOF
require("toggleterm").setup{
  open_mapping = [[<c-`>]],
  hide_number = true,
  shade_terminals = true,
  auto_scroll = true}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
  cmd = "lazygit", 
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<D-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

EOF
