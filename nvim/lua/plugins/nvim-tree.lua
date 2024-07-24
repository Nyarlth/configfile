return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    },
    keys = {
      { "<leader><cr>", "<cmd>NvimTreeToggle<cr>", desc = "TreeToggle" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    lazy = true,
    init = function()
      print("neotreeload")
    end,
  },
}
