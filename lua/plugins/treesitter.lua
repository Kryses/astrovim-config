-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {"nushel/tree-sitter-nu", build=":TSUpdate nu"}
  },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "nu"
      -- add more arguments for adding more treesitter parsers
    },
  },
  build = ":TSUpdate"
}
