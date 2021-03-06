vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        nvim_lsp = {kind = "  ", priority = 100},
        path = {kind = "  ", priority = 110},
        buffer = {kind = "  ", priority = 10},
        calc = {kind = "  ", priority = 120},
        vsnip = {kind = "  ", priority = 150},
        ultisnips = {kind = "  ", priority = 150},
        tabnine = {
					kind = " 歷 ",
					sort = true,
					priority = 90
				},
        nvim_lua = {kind = "  ", priority = 100},
        spell = {kind = "  ", priority = 10},
        tags = false,
        treesitter = {kind = "  ", priority = 50},
        emoji = {kind = " ﲃ ", priority = 50}
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-u>", "compe#scroll({ 'delta': +4 })", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true, silent = true})
