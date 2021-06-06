vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_root_folder_modifier = 'test'

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["l"]              = tree_cb("edit"),
  ["h"]              = tree_cb("close_node"),
  ["<CR>"]           = tree_cb("cd"),
  ["<C-v>"]          = tree_cb("vsplit"),
  ["<C-x>"]          = tree_cb("split"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["y"]              = tree_cb("copy_name"),
  ["Y"]              = tree_cb("copy_path"),
  ["gy"]             = tree_cb("copy_absolute_path"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
-- vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}
