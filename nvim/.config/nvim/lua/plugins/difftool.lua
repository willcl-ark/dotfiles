return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("diffview").setup()
  end,
  vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "[D]iff [O]pen" }),
  vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "[D]iff [F]ile history" }),
  vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "[D]iff [C]lose" }),
  vim.keymap.set("n", "<leader>dp", "<cmd>DiffviewToggleFiles<CR>", { desc = "[D]iff [T]oggle files panel" }),
}
