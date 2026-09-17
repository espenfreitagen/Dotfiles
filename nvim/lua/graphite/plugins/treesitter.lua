return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require('nvim-treesitter.config').setup({
            ensure_installed = {
                "csv",
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "python",
                "json",
                "yaml",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "javascript",
                "typescript",
                "hyprlang",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end,
}

