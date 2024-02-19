" https://github.com/akinsho/toggleterm.nvim
lua << EOF

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

EOF
