return {
  { "jmcantrell/vim-virtualenv", version = false },
  {
    "nathangrigg/vim-beancount",
    version = false,
    ft = "beancount",
    config = function()
      vim.o.foldlevel = 0
    end,
  },
}
