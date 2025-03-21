return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      terraformls = {
        filetypes = { "terraform" },
        cmd = {
          "terraform-ls",
          "serve",
          "-log-file",
          vim.fs.dirname(require("vim.lsp.log").get_filename()) .. "/terraform-ls.log",
        },
      },
    },
  },
}
