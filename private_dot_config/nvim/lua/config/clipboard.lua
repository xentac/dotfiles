-- Use system clipboard for all yank/delete/put operations
vim.opt.clipboard = "unnamedplus"

-- (Optional) If you are using Neovim over SSH, you can force OSC 52 integration:
if vim.fn.getenv("SSH_TTY") ~= vim.NIL then
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.osc52").copy,
      ["*"] = require("vim.ui.osc52").copy,
    },
    paste = {
      ["+"] = require("vim.ui.osc52").paste,
      ["*"] = require("vim.ui.osc52").paste,
    },
  }
end
