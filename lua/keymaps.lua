local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}


-- switch tabs using tab or shift-tab keys (akinsho/bufferline.nvim)--
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- clear search highlight
map('n', '<F1>', ':nohl<CR>', default_opts)
