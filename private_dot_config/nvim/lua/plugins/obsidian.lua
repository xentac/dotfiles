return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Vault/",
      },
    },
    -- This function determines the filename of new notes
    note_id_func = function(title)
      -- If a title is provided (e.g. from a link [[My New Note]]),
      -- use it as the filename.
      if title ~= nil then
        return title
      end

      -- Fallback: if no title is provided (e.g. :ObsidianNew with no args),
      -- use a timestamp so you don't get an error.
      return tostring(os.time())
    end,

    -- see below for full list of options 👇
  },
}
