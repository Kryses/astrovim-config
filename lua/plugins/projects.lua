return {
   "ahmedkhalf/project.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    opts = {
        manual_mode = false,
        detection_methods = {"pattern", "lsp", "buffer"},
        patterns = {"=src", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml"},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
        datapath = vim.fn.stdpath("data"),
    },
    config = function(opts)
        require("project_nvim").setup(opts)
        require("telescope").load_extension("projects")
    end
}
