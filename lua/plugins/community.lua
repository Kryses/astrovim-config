return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.workflow.bad-practices-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  -- { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
}
