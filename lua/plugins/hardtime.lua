return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disabled_filetypes = { -- 在某些文件类型中禁用 (比如文件树)
      "NvimTree",
      "neo-tree",
      "lazy",
      "mason",
    },
  },
}

