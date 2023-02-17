return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            height = 0.99,
            width = 0.99,
            prompt_position = "bottom",
          },

          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { shorten = 3 },

          extensions = {
            fzf = {
              fuzzy = true, -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true, -- override the file sorter
              case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
          },
          mappings = {
            i = {
              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,

              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,

              ["<C-c>"] = require("telescope.actions").close,

              ["<Down>"] = require("telescope.actions").move_selection_next,
              ["<Up>"] = require("telescope.actions").move_selection_previous,

              ["<CR>"] = require("telescope.actions").select_default,
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,

              ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

              ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
              ["<PageDown>"] = require("telescope.actions").results_scrolling_down,

              ["<Tab>"] = require("telescope.actions").toggle_selection
                + require("telescope.actions").move_selection_worse,
              ["<S-Tab>"] = require("telescope.actions").toggle_selection
                + require("telescope.actions").move_selection_better,
              ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
              ["<M-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,
              ["<C-l>"] = require("telescope.actions").complete_tag,
              ["<C-_>"] = require("telescope.actions").which_key, -- keys from pressing <C-/>
            },

            n = {
              ["<esc>"] = require("telescope.actions").close,
              ["<CR>"] = require("telescope.actions").select_default,
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,

              ["<Tab>"] = require("telescope.actions").toggle_selection
                + require("telescope.actions").move_selection_worse,
              ["<S-Tab>"] = require("telescope.actions").toggle_selection
                + require("telescope.actions").move_selection_better,
              ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
              ["<M-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,

              ["j"] = require("telescope.actions").move_selection_next,
              ["k"] = require("telescope.actions").move_selection_previous,
              ["H"] = require("telescope.actions").move_to_top,
              ["M"] = require("telescope.actions").move_to_middle,
              ["L"] = require("telescope.actions").move_to_bottom,

              ["<Down>"] = require("telescope.actions").move_selection_next,
              ["<Up>"] = require("telescope.actions").move_selection_previous,
              ["gg"] = require("telescope.actions").move_to_top,
              ["G"] = require("telescope.actions").move_to_bottom,

              ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

              ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
              ["<PageDown>"] = require("telescope.actions").results_scrolling_down,

              ["?"] = require("telescope.actions").which_key,
            },
          },
        },
      })

      -- Needed to actually load fzf
      require("telescope").load_extension("fzf")
      -- See `:help telescope.builtin`
      vim.keymap.set(
        "n",
        "<leader>?",
        require("telescope.builtin").oldfiles,
        { desc = "[?] Find recently opened files" }
      )
      vim.keymap.set(
        "n",
        "<leader><space>",
        require("telescope.builtin").buffers,
        { desc = "[ ] Find existing buffers" }
      )
      vim.keymap.set("n", "<leader>sb", function()
        require("telescope.builtin").current_buffer_fuzzy_find({ fuzzy = false, case_mode = "ignore_case" })
      end, { desc = "[S]earch [B]uffer Fuzzily search in current buffer]" })
      vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sm", require("telescope.builtin").man_pages, { desc = "[S]earch [M]an pages" })
      vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
    end,
  },
  {
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    --use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
