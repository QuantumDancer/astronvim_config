-- Customize Treesitter
-- In AstroNvim v6, treesitter features are configured via AstroCore instead of
-- the nvim-treesitter plugin directly (which now only handles parser installation).

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    treesitter = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "ini",
        "json",
        "lua",
        "make",
        "perl",
        "python",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "vim",
        "xml",
        "yaml",
      },
    },
  },
}
