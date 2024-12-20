-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.workflow.bad-practices-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },

  -- import/override with your plugins folder
}
