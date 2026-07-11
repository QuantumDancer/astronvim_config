# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Format Lua files
stylua lua/

# Lint Lua files
selene lua/

# Check formatting without writing
stylua --check lua/
```

There is no test suite. Validate changes by launching Neovim.

## Architecture

This is an **AstroNvim v5** configuration built on **lazy.nvim**.

**Entry point:** `init.lua` bootstraps lazy.nvim, then delegates to `lua/lazy_setup.lua` (plugin specs) and `lua/polish.lua` (post-setup Lua that runs last).

**Plugin loading order in `lazy_setup.lua`:**
1. `AstroNvim/AstroNvim` — the base distro (`leader = <Space>`, `localleader = ,`)
2. `{ import = "community" }` — `lua/community.lua` pulls in AstroCommunity packs
3. `{ import = "plugins" }` — `lua/plugins/*.lua` holds all local overrides

**`lua/community.lua`** declares which AstroCommunity language packs are active (bash, docker, go, helm, html-css, json, lua, markdown, python, toml, yaml, catppuccin colorscheme, trouble-nvim, disable-tabline recipe).

**`lua/plugins/`** — each file either overrides an AstroCommunity pack or adds new behaviour:
- `astroui.lua` — sets colorscheme to `catppuccin-macchiato`
- `treesitter.lua` — extends `ensure_installed` with extra parsers
- `harper.lua` — configures harper-ls (grammar/spell LSP) via mason-tool-installer + astrolsp; severity is `hint`
- `terraform.lua` — custom terraform pack replacing `tfsec` with `trivy` for linting
- `helm.lua` — detects helm files via `Chart.yaml` lookup; sets `{{/* %s */}}` as commentstring
- `ansible.lua` — detects `yaml.ansible` filetype by directory name and buffer content heuristics
- `user.lua` — always-loaded plugins: vim-fugitive, vim-rhubarb, vim-obsession, vim-alloy
- `astrocore.lua`, `astrolsp.lua`, `mason.lua`, `none-ls.lua` — **inactive template files** guarded by `if true then return {} end`; remove that guard to activate

**Template files** (the four with the `if true then return {} end` guard at the top) exist as commented-out examples. They will return an empty spec until that guard is removed — they are not bugs.

**`lua/polish.lua`** runs after all plugins load. Currently sets global tab settings (4-space), registers the `alloy` filetype extension, overrides alloy indentation to 2 spaces, and sets `conceallevel = 1`.

## Lua Style

Enforced by `.stylua.toml`: 2-space indent, 120-column width, Unix line endings, double-quote preference, no call parentheses on single-argument string/table calls, simple statements collapsed to one line.

Selene linting uses the `neovim` standard library (`selene.toml`). The `vim` global is typed `any`.
