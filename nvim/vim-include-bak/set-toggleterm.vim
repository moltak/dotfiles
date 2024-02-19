" https://github.com/akinsho/toggleterm.nvim
lua << EOF
-- float
require("toggleterm").setup{
  --open_mapping = [[<c-`>]],
  hide_number = true,
  auto_scroll = true,
  shade_terminals = true,
  shading_factor = 1,
  direction = "float",
  insert_mappings = true,
    float_opts = {
    border = "double",
    winblend = 3,
  }
  --shell = "tmux"
}

-- bottom
require("toggleterm").setup{
  open_mapping = [[<c-`>]],
  hide_number = true,
  auto_scroll = true,
  shade_terminals = true,
  shading_factor = 1,
  direction = "horizontal"
  --shell = "tmux"
}

-- lazygit
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
vim.api.nvim_set_keymap("n", "sog", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

EOF
