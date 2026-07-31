-- Use system clipboard for all yank/delete/put operations
vim.opt.clipboard = "unnamedplus"

-- Force OSC 52 integration if running over SSH or inside TMUX
if vim.env.SSH_TTY or vim.env.TMUX then
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
