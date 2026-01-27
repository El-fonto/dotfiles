--return {
--"mason-org/mason.nvim",
--opts = function(_, opts)
--vim.list_extend(opts.ensure_installed, {

--"harper-ls",

-- Not installing the tree-sitter CLI through mason due do this
-- https://github.com/LazyVim/LazyVim/issues/6437#issuecomment-3304278107
-- "tree-sitter-cli",
-- marksman and markdownlint come by default in the lazyvim config
--
-- I installed markdown-toc as I use to to automatically create and upate
-- the TOC at the top of each file
-- vim.list_extend(opts.ensure_installed, { "markdownlint-cli2", "marksman", "markdown-toc" })
--})
--end,
--}
