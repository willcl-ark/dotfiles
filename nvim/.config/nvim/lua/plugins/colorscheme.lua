return {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          telescope = true,
          leap = true,
          harpoon = true,
          mason = true,
          cmp = true,
          treesitter = true,
        },
      })
    end,
  },
  {
    "navarasu/onedark.nvim", -- Theme inspired by Atom
    lazy = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
  },
  {
    "lunarvim/synthwave84.nvim",
    lazy = true,
  },
}
