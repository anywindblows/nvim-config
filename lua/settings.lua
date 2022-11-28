local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
local o = vim.o                 -- global o
local telescope = require(      -- global telescope
'telescope.builtin'
)

opt.mouse = 'a'                 -- enable mouse click
opt.mouse = 'v'                 -- middle-click paste with 
opt.encoding = 'utf-8'          -- set encoding to utf-8
opt.number = true               -- add line numbers
opt.relativenumber = true       -- toggle on relativenumber
opt.scrolloff = 7
opt.tabstop = 4                 -- number of columns occupied by a tab 
opt.softtabstop = 4             -- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4              -- width for autoindents
opt.expandtab = true            -- converts tabs to white space
opt.autoindent = true           -- indent a new line the same amount as the line just typed
opt.fileformat = 'unix'         -- unix fileformat
opt.smartindent = true          --
opt.tabstop = 2                 --
opt.expandtab = true            -- indent and tabs
opt.shiftwidth = 2              --

opt.ignorecase = true           -- case insensitive 
opt.showmatch = true            -- show matching 
opt.hlsearch = true             -- highlight search 
opt.incsearch = true            -- incremental search
opt.wildmode = 'longest', 'list'-- get bash-like tab completions
opt.cc = '80'  		            -- set an 80 column border for good coding style
opt.clipboard = 'unnamedplus'   -- using system clipboard
opt.cursorline = true           -- highlight current cursorline
opt.ttyfast = true              -- Speed up scrolling in Vim

cmd([[
filetype indent on
filetype plugin on
syntax on
]])
-- disable auto-comment new line
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- format jinja2 syntax at html files.
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]


--------------------------------Colorshemes------------------------------------
opt.termguicolors = true

o.background = "dark" -- or "light" for light mode
cmd'colorscheme gruvbox'
--cmd'colorscheme onedark'


---------------------------------Nvim-Tree-------------------------------------
g.loaded_netrw = 0
g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  sort_by = "case_sensitive",
  open_on_setup = true,
  open_on_setup_file = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
}


---------------------------------Lualine---------------------------------------
require('lualine').setup {
  options = { theme  = 'gruvbox' },
}


-------------------------------Bufferline--------------------------------------
require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      },
    },
  },
}


-------------------------------Telescope---------------------------------------
vim.keymap.set('n', 'ff', telescope.find_files, {})
vim.keymap.set('n', 'fg', telescope.live_grep, {})


---------------------------------LSP-------------------------------------------
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')
local servers = { 'pyright' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
