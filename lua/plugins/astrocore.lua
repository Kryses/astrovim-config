-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      v = {
        ["J"] = { ":m '>+1<CR>gv=gv" },
        ["K"] = { ":m '<-2<CR>gv=gv" },
        ["<leader>d"] = { '"_d', desc = "Clear clipboard" },
        ["<leader>y"] = { '"+y', desc = "Copy to clipboard" },
        ["<leader>Y"] = { '"+Y', desc = "Copy to clipboard" },
        ["<leader>a"] = { desc = " Chat GPT" },
        ["<leader>ap"] = { "<cmd>ChatGPT<cr>", desc = "Chat GPT Prompt" },
        ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc = "Complete Code" },
        ["<leader>aa"] = { "<cmd>ChatGPTActAs<cr>", desc = "Chat GPT Act As" },
        ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code" },
        ["<leader>as"] = { "<cmd>ChatGPTRun summarize_code<cr>", desc = "Summarize Code" },
        ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs" },
        ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code" },
        ["<leader>ar"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", desc = "Code Readability Analysis" },
        ["<leader>at"] = { "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests" },
        ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<cr>", desc = "Add Docstring" },
        ["<leader>ai"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with Instructions" },
      },
      i = {
        ["<C-c>"] = { "<Esc>" },
        ["<C-y>"] = { 'copilot#Accept("<CR>")', expr = true, replace_keycodes = false },
      },
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<S-h>"] = {
          function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<S-l"] = {
          function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<A-J>"] = { "i<CR><Esc>" },
        ["J"] = { "mzJ`z" },
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        ["<leader>p"] = { '"_dP', desc = "Paste from clipboard" },
        ["<leader>y"] = { '"+y', desc = "Copy to clipboard" },
        ["<leader>Y"] = { '"+Y', desc = "Copy to clipboard" },
        ["Q"] = { "<nop>" },
        -- ['<C-k>'] = {'<cmd>cnext<cr>zz'},
        -- ['<C-j>'] = {'<cmd>cprev<cr>zz'},
        ["<leader>k"] = { "<cmd>lnext<cr>zz", desc = "Next Location List" },
        ["<leader>j"] = { "<cmd>lprev<cr>zz", desc = "Previous Location List" },
        ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Substitute Current" },
        ["<leader>fp"] = {
          "<cmd> lua require('telescope').extensions.projects.projects() <cr>",
          desc = "Find Projects",
        },
        ["<leader>lp"] = {
          "<cmd> lua require('nvim-dap-projects').search_project_config() <cr>",
          desc = "Load Project",
        },

        -- Chat GPT
        ["<leader>a"] = { desc = "󰭹 Chat GPT" },
        ["<leader>ap"] = { "<cmd>ChatGPT<cr>", desc = "Chat GPT Prompt" },
        ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc = "Complete Code" },
        ["<leader>aa"] = { "<cmd>ChatGPTActAs<cr>", desc = "Chat GPT Act As" },
        ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code" },
        ["<leader>as"] = { "<cmd>ChatGPTRun summarize_code<cr>", desc = "Summarize Code" },
        ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs" },
        ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code" },
        ["<leader>ar"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", desc = "Code Readability Analysis" },
        ["<leader>at"] = { "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests" },
        ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<cr>", desc = "Add Docstring" },
        ["<leader>ai"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with Instructions" },

        -- Obsidian
        ["<leader>z"] = { desc = " Obsidian" },
        ["<leader>zs"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
        ["<leader>zf"] = { "<cmd>ObsidianFollowLink<cr>", desc = "Follow Link" },
        ["<leader>zo"] = { "<cmd>:ObsidianOpen", desc = "Open" },
        ["<leader>zn"] = { "<cmd>:ObsidianNew", desc = "New" },
        ["<leader>zb"] = { "<cmd>:ObsidianBacklinks<cr>", desc = "Backlinks" },
        ["<leader>zT"] = { "<cmd>:ObsidianTags ", desc = "Tags" },
        ["<leader>zt"] = { "<cmd>:ObsidianTomorrow<cr>", desc = "Tomorrow" },
        ["<leader>zy"] = { "<cmd>:ObsidianYesterday<cr>", desc = "Yesterday" },
        ["<leader>zi"] = { "<cmd>:ObsidianTemplate ", desc = "Template" },
        ["<leader>zS"] = { "<cmd>:ObsidianSearch ", desc = "Search" },
        ["<leader>zl"] = { "<cmd>:ObsidianLink ", desc = "Link" },
        ["<leader>zN"] = { "<cmd>:ObsidianLinkNew ", desc = "Link New" },
        ["<leader>zw"] = { "<cmd>:ObsidianWorkspace<cr>", desc = "Workspace" },

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
