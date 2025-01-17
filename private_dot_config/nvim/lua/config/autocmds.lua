-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path, buf)
        if vim.regex(".*\\.beancount$"):match_str(path) ~= nil then
          return "beancount"
        end
        local bigfile_size = vim.g.bigfile_size or 1000000
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.fn.getfsize(path) > bigfile_size
            and "bigfile"
          or nil
      end,
    },
  },
})
