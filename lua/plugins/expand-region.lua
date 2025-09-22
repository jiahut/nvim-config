return {
  "terryma/vim-expand-region",
  keys = {
    { "v", "<Plug>(expand_region_expand)", mode = "v", desc = "Expand region" },
    { "V", "<Plug>(expand_region_shrink)", mode = "v", desc = "Shrink region" },
  },
  init = function()
    -- 自定义文本对象
    vim.g.expand_region_text_objects = {
      iw = 0,
      iW = 0,
      ['i"'] = 0,
      ["i'"] = 0,
      ["i]"] = 1,  -- 支持嵌套
      ib = 1,       -- 支持嵌套
      iB = 1,       -- 支持嵌套
      il = 0,
      ip = 0,
      ie = 0,
    }
  end,
}
