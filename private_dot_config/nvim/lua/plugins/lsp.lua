-- On NixOS every LSP server comes from the system (development.nix in
-- nixos-config), not Mason; mason = false tells LazyVim to use the one on PATH.
local on_nixos = vim.uv.fs_stat("/etc/NIXOS") ~= nil

local servers = {
  terraformls = {
    mason = not on_nixos,
    filetypes = { "terraform" },
    cmd = {
      "terraform-ls",
      "serve",
      "-log-file",
      vim.fs.dirname(require("vim.lsp.log").get_filename()) .. "/terraform-ls.log",
    },
  },
  beancount = {
    mason = not on_nixos,
    cmd = { "beancount-language-server", "--stdio" },
    filetypes = { "beancount" },
    init_options = {
      journal_file = "/home/xentac/coding/beancount/finance/data/finances.beancount",
    },
  },
}

if on_nixos then
  -- Servers pulled in by LazyVim extras; on NixOS they must not go through
  -- Mason. If :Mason still tries to install something after first launch,
  -- add it here (and to development.nix if it is missing from PATH).
  servers.gopls = { mason = false }
  servers.basedpyright = { mason = false }
  servers.ts_ls = { mason = false }
  servers.lua_ls = { mason = false }
  -- Nix language server, for editing the nixos-config repo
  servers.nil_ls = { mason = false }
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = servers,
  },
}
