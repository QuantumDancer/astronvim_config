---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "harper-ls")
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SpellCheck = true,
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = false, -- code comments often don't follow this
                UnclosedQuotes = true,
                WrongQuotes = false,
                LongSentences = false, -- code comments can be longer
                RepeatedWords = true,
                Spaces = true,
                Matcher = true,
                CorrectNumberSuffix = true,
              },
              diagnosticSeverity = "hint",
              dialect = "American",
            },
          },
        },
      },
    },
  },
}
