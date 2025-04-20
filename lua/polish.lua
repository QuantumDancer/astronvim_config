-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.g.tabstop = 4
vim.g.softtabstop = 4
vim.g.shiftwidth = 4
vim.g.expandtab = true

vim.filetype.add {
  extension = {
    alloy = "alloy.j2",
  },
}

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "alloy",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

vim.opt.conceallevel = 1
