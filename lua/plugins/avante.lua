-- views can only be fully collapsed with the global statusline
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  keys = {
    { "<leader>an", "<cmd>AvanteChatNew<cr>", desc = "New Avante Chat" },
    {
      "<leader>aC",
      function()
        require("avante.path").clear()
      end,
      desc = "Clear Avante Context",
      mode = { "n", "v" },
    },
  },
  opts = {
    laststatus = 3,
    -- add any opts here
    -- for example
    provider = "openai",
    -- openai = {
    --   endpoint = "https://c-z0-api-01.hash070.com/v1",
    --   -- endpoint = "https://cfwus02.opapi.win/v1",
    --   model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
    --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    --   temperature = 0.5,
    --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    -- },

    providers = {
      openai = {
        -- api_key_name = "AICHAT_API_KEY",
        -- endpoint = "http://127.0.0.1:8000/v1",
        api_key_name = "TRANSAI_API_KEY",
        endpoint = "https://hk-intra-paas.transsion.com/tranai-proxy/v1",
        -- endpoint = "https://cfwus02.opapi.win/v1",
        -- model = "trans:claude-3-7-sonnet@20250219", -- your desired model (or use gpt-4o, etc.)
        -- model = "trans:claude-sonnet-4@20250514", -- your desired model (or use gpt-4o, etc.)
        model = "kimi-k2-turbo-preview",
        extra_request_body = {
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          temperature = 0.5,
          max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        },
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
    },
    -- 使用函数动态更新系统提示，包含 mcphub 服务器信息
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      if hub then
        return hub:get_active_servers_prompt()
      else
        return "I'm an AI assistant powered by Avante."
      end
    end,

    -- 添加 mcphub 工具，使用函数避免在 mcphub 加载前引用它
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
    -- 如果您使用内置的 Neovim 服务器，可能需要禁用以下工具以避免与 MCP 服务器冲突
    disabled_tools = {
      "list_files",
      "search_files",
      "read_file",
      "create_file",
      "rename_file",
      "delete_file",
      "create_dir",
      "rename_dir",
      "delete_dir",
      "bash",
      "web_search",
      "fetch",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- build = "make",
  -- for windows
  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    "ravitemer/mcphub.nvim", -- 确保添加 mcphub.nvim 作为依赖
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
