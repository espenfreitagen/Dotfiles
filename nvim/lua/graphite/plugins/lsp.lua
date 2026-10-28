return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.diagnostic.config({
      signs = true,
      underline = true,
      virtual_text = false,
      severity_sort = true,
      update_in_insert = false,
    })
    -- Global defaults for all servers
    vim.lsp.config('*', {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
          autotrigger = true,
          convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
		end,
      })
        local keymap = vim.keymap.set
        --keymap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        --keymap("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
        --keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        --keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
        --keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end,
    })

    local clangd_allowlist = {
        vim.env.HOME .. 
        '/.platformio/packages/toolchain-*/bin/*',
        --'/.platformio/packages/*',
        '/usr/bin/*'
        -- if you want to allow all compilers installed here
        -- you can add other compiler directories here
    }

    local clangd_opts = {
        -- Add custom command-line flags:
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
        -- Customize clangd's behaviour:
        init_options = { fallbackFlags = { '-std=c++17' }, },
        cmd = {
            'clangd',
            '--query-driver=' .. table.concat(clangd_allowlist, ','),
        }
    }

    local ccls_config = {
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'h' },
        -- you can configure other options for the ccls server here
    }
    -- Servers 
    local servers = {
      "clangd",
      "clangd_opts",
      "ccls",
      "lua_ls",
      "basedpyright",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "html",
      "cssls",
    }

    -- Enable each server
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}

