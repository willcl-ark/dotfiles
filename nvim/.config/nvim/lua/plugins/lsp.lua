return {
  "neovim/nvim-lspconfig", -- LSP Configuration & Plugins
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    "j-hui/fidget.nvim",

    -- Formatting and linting
    "jose-elias-alvarez/null-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- Create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinitions")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementations")
      nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinitions")
      nmap("<leader>gs", require("telescope.builtin").lsp_document_symbols, "[G]oto [S]ymbols")
      nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

      -- Lesser used LSP functionality
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        if vim.lsp.buf.format then
          vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
          vim.lsp.buf.formatting()
        end
      end, { desc = "Format current buffer with LSP" })
    end

    -- Open diagnostics in hover window
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = 0,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })

    -- Setup mason so it can manage external tooling
    local mason_ok, mason = pcall(require, "mason")
    if not mason_ok then
      vim.notify("mason failed to load")
      return
    end
    mason.setup()

    -- Enable the following language servers
    local servers = { "pyright", "lua_ls", "gopls", "cmake" }

    -- Ensure the servers above are installed
    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_ok then
      vim.notify("mason-lspconfig failed to load")
      return
    end
    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    for _, lsp in ipairs(servers) do
      require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Turn on lsp status information
    local fidget_ok, fidget = pcall(require, "fidget")
    if not fidget_ok then
      vim.notify("fidget failed to load")
      return
    end
    fidget.setup()

    -- Make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
      vim.notify("lspconfig failed to load")
      return
    end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT)
            version = "LuaJIT",
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = { enable = false },
        },
      },
    })

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "rust-analyzer" },
    })
    -- Null-ls
    local null_ls_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_ok then
      vim.notify("null_ls failed to load")
      return
    end

    local sources = {
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" },
      }),
      null_ls.builtins.formatting.clang_format.with({
        filetypes = { "cpp", "hpp", "c", "h" },
      }),
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt.with({
        extra_filetypes = { "bash" },
      }),
      null_ls.builtins.formatting.stylua,
    }

    null_ls.setup({ sources = sources })
  end,
}
