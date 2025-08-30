return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({
        -- 默认输入法（普通模式下使用，例如英文）
        default_im_select = "1033", -- 英文输入法代码

        -- im-select.exe 的路径
        default_command = "im-select.exe",

        -- 触发切换到默认输入法的事件
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

        -- 恢复上一次输入法的事件（插入模式下恢复 RIME）
        set_previous_events = { "InsertEnter" },

        -- 异步切换输入法，减少延迟
        async_switch_im = true,
      })
    end,
  },
}
