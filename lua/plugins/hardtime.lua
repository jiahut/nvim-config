return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    max_count = 10, -- 允许在 1000ms 内连续按键的最大次数 (默认是 3，这里改成 10)
    disabled_filetypes = { -- 在某些文件类型中禁用 (比如文件树)
      "NvimTree",
      "neo-tree",
      "lazy",
      "mason",
    },
  },
}

