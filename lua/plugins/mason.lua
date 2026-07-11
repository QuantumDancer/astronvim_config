if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- Deliberately no "tree-sitter-cli": every prebuilt tree-sitter binary
        -- (Mason's included) needs glibc >= 2.35, and RHEL 9 has 2.34. Mason's
        -- bin dir shadows PATH inside nvim, so installing it here would hide the
        -- working system CLI behind one that cannot run. Let AstroCore fall back
        -- to the system tree-sitter instead (EPEL on RHEL, dnf/brew elsewhere).
      },
    },
  },
}
