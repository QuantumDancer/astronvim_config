-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "comment",
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
}
