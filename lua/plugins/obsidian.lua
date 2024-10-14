return {
  "epwalsh/obsidian.nvim",
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  event = { "BufReadPre  */krys-brain/*.md" },
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<leader>N"] = { desc = "  Notes" },
            ["<leader>Nn"] = { "<cmd>ObsidianNew<cr>", desc = "󰎚 New Note" },
            ["<leader>NC"] = { "<cmd>ObsidianTOC<cr>", desc = "󰠶 Table of Contents" },
            ["<leader>Nc"] = { "<cmd>ObsidianToggleCheckbox<cr>", desc = " Toggle Check" },
            ["<leader>No"] = { "<cmd>ObsidianOpen<cr>", desc = "󰏕 Open in Obsidian" },
            ["<leader>NS"] = { "<cmd>ObsidianSearch<cr>", desc = "󰍉 Search" },
            ["<leader>Ns"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = " Switch" },
            ["<leader>Nt"] = { "<cmd>ObsidianToday<cr>", desc = "󰃶 Today" },
            ["<leader>NT"] = { "<cmd>ObsidianTags<cr>", desc = " Tags" },
            ["<leader>Nd"] = { "<cmd>ObsidianDailies<cr>", desc = " Dailies" },
            ["<leader>Nl"] = { "<cmd>ObsidianLink<cr>", desc = " Link" },
            ["<leader>Nb"] = { "<cmd>ObsidianBacklinks<cr>", desc = "󰌍 Back Links" },
            ["<leader>NL"] = { "<cmd>ObsidianLinks<cr>", desc = " Links" },
            ["<leader>Nr"] = { "<cmd>ObsidianRename<cr>", desc = "󰑕 Rename" },
            ["<leader>Np"] = { "<cmd>ObsidianPasteImg<cr>", desc = " Paste Image" },
            ["<leader>NN"] = { desc = " New..." },
            ["<leader>NNl"] = { "<cmd>ObsidianLinkNew<cr>", desc = "󱄀 New Link" },
            ["<leader>NNt"] = { "<cmd>ObsidianTemplate<cr>", desc = " Template" },
            ["<leader>NNe"] = { "<cmd>ObsidianExtractNote<cr>", desc = " Extract Note" },
            ["<leader>NNN"] = { "<cmd>ObsidianNewFromTemplate<cr>", desc = "  New From Template" },
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return "<Cmd>ObsidianFollowLink<CR>"
                else
                  return "gf"
                end
              end,
              desc = "Obsidian Follow Link",
            },
          },
        },
      },
    },
  },
  opts = {
    dir = vim.env.HOME .. "/krys-brain", -- specify the vault location. no need to call 'vim.fn.expand' here
    use_advanced_uri = true,
    finder = "telescope.nvim",
    new_notes_location = "05 - Fleeting",
    daily_notes = {
      folder = "06 - Daily/daily",
      date_format = "%Y-%m-%d",
    },
    templates = {
      subdir = "99 - Meta/templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
    disable_frontmatter = true,
    nvim_completiom = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = vim.ui.open or function(url) require("astrocore").system_open(url) end,
  },
}
