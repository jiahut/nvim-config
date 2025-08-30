return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "html", "clojure","nu", "rust", "java", "go", "bash", "javascript", "ruby", "python", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        incremental_selection = {
            enable = true,
            enable = true,
            keymaps = {
                node_incremental = "v",
                node_decremental = "V",
            },
        },
    },
  },
}
