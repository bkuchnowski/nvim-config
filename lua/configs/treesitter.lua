local options = {
    ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "gitignore",
    "json",
    "make",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
