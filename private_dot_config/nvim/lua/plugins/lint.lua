return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            function()
              local root = vim.fs.root(0, { ".git", ".markdownlint.yaml" }) or vim.fn.getcwd()
              return vim.fs.joinpath(root, ".markdownlint.yaml")
            end,
            "-",
          },
        },
      },
    },
  },
}
