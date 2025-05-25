require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "markdown", "go" },
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  fold = { enable = true },
  additional_vim_regex_highlighting = false,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    vim.wo.foldenable = true
    vim.wo.foldlevel = 0
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  callback = function()
    vim.defer_fn(function()
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
      vim.wo.foldenable = true
      vim.wo.foldlevel = 0
    end, 20)
  end,
})
