return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "beancount",
      },
      function(_, _)
        vim.filetype.add({
          extension = {
            beancount = { "beancount", { priority = 100 } },
          },
        })
      end,
    },
  },
}
