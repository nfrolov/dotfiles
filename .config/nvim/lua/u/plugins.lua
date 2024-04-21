return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    init = function ()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'everforest',
        callback = function ()
          vim.api.nvim_set_hl(0, '@tag.delimiter', { link = 'Grey' })
          vim.api.nvim_set_hl(0, '@markup.heading', {})
          vim.api.nvim_set_hl(0, '@markup.italic', {})
          vim.api.nvim_set_hl(0, '@markup.strikethrough', {})
          vim.api.nvim_set_hl(0, '@markup.underline', {})
          vim.api.nvim_set_hl(0, '@string.special.url.html', {})
          vim.api.nvim_set_hl(0, '@tag.javascript', { link = '@type' })
          vim.api.nvim_set_hl(0, '@tag.typescript', { link = '@type' })
          vim.api.nvim_set_hl(0, '@tag.tsx', { link = '@type' })
          vim.api.nvim_set_hl(0, '@keyword.import.javascript', { link = '@keyword' })
          vim.api.nvim_set_hl(0, '@keyword.import.typescript', { link = '@keyword' })
          vim.api.nvim_set_hl(0, '@keyword.import.tsx', { link = '@keyword' })
        end,
      })
    end,
    config = function ()
      -- vim.g.everforest_background = 'hard'
      vim.g.everforest_disable_italic_comment = true
      vim.cmd.colorscheme('everforest')
    end,
  },
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    init = function ()
      vim.g.fugitive_dynamic_colors = 0
    end,
  },
  {
    'tpope/vim-eunuch',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-commentary',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'tpope/vim-unimpaired',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'julian/vim-textobj-variable-segment',
    dependencies = {
      'kana/vim-textobj-user',
    },
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('nvim-surround').setup({})
    end
  },
  {
    'folke/persistence.nvim',
    event = { 'VeryLazy' },
    config = function ()
      if vim.fn.argc() ~= 0 then
        return
      end
      require('persistence').setup({ save_empty = true })
      vim.schedule(require('persistence').load)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'yioneko/nvim-yati',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c',
          'cmake',
          'css',
          'html',
          'javascript',
          'json',
          'lua',
          'lua',
          'scss',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
        highlight = {
          enable = true,
          disable = { 'scss' },
          additional_vim_regex_highlighting = { 'javascript' },
        },
        -- yati = {
        --   enable = true,
        --   disable = {},
        --   default_lazy = false,
        -- },
        indent = {
          enable = false,
        },
        playground = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = false,
            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
        },
      })
    end,
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function ()
      require('treesitter-context').setup({
        max_lines = 6,
        trim_scope = 'inner',
      })
    end,
  },
  {
    'wansmer/treesj',
    keys = {
      { 'gS', function () require('treesj').split() end },
      { 'gJ', function () require('treesj').join() end },
    },
    config = function ()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    cmd = { 'Telescope' },
    keys = {
      { '<c-p>', function () require('telescope.builtin').git_files() end },
      { '<leader>fb', function () require('telescope.builtin').buffers() end },
      { '<leader>fo', function () require('telescope.builtin').oldfiles({ cwd = vim.loop.cwd() }) end },
      { '<leader>fg', function () require('telescope.builtin').live_grep() end },
      { '<leader>fb', function () require('telescope').extensions.file_browser.file_browser() end },
      { '<leader>lr', function () require('telescope.builtin').lsp_references() end },
    },
    config = function ()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          preview = false,
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<m-q>'] = false,
              ['<c-x>'] = false,
              ['<c-v>'] = false,
              ['<c-t>'] = false,
              ['<c-u>'] = false,
              ['<c-d>'] = false,
            },
          },
        },
        pickers = {
          git_files = {
            theme = 'dropdown',
            layout_config = {
              width = 120,
              height = 30,
            },
            show_untracked = true,
          },
          buffers = {
            theme = 'dropdown',
          },
          oldfiles = {
            theme = 'dropdown',
          },
          live_grep = {
            preview = true,
          },
        },
        extensions = {
          file_browser = {
            theme = 'dropdown',
            layout_config = {
              width = 120,
              height = 30,
            },
            depth = false,
            display_stat = false,
            git_status = false,
            prompt_path = true,
          },
        },
      })
      require('telescope').load_extension('file_browser')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function ()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          -- theme = 'everforest',
          -- theme = require('lualine.themes.everforest'),
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode' },
          },
          lualine_b = {
            { 'diagnostics' }
          },
          lualine_c = {
            { 'filename', path = 1 },
          },
          lualine_x = {
            { 'filetype' },
          },
          lualine_y = {},
        },
        tabline = {
          lualine_a = {
            { 'buffers', show_filename_only = false, symbols = { modified = '+' } },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
    },
    event = { 'InsertEnter' },
    config = function ()
      local cmp = require('cmp')
      local snippy = require('snippy')
      cmp.setup({
        snippet = {
          expand = function (args)
            require('snippy').expand_snippet(args.body)
          end,
        },
        completion = {
          -- keyword_length = 3,
        },
        mapping = cmp.config.mapping.preset.insert({
          ['<tab>'] = function (fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'select' })
            elseif snippy.can_expand_or_advance() then
              snippy.expand_or_advance()
            else
              fallback()
            end
          end,
          ['<s-tab>'] = function (fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'select' })
            elseif snippy.can_jump(-1) then
              snippy.previous()
            else
              fallback()
            end
          end,
          ['<c-n>'] = function ()
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'select' })
            else
              cmp.complete()
            end
          end,
          ['<c-p>'] = function ()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'select' })
            else
              cmp.complete()
            end
          end,
          ['<cr>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          {
            name = 'buffer',
            option = {
              keyword_pattern = [[\k\+]],
              get_bufnrs = function ()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = 'path' },
        }),
      })
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function ()
      require('fidget').setup({})
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'folke/neodev.nvim',
        config = function ()
          require('neodev').setup({})
        end,
      },
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
      },
      'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      vim.diagnostic.config({
        underline = true,
        update_in_insert = true,
        virtual_text = false, -- { spacing = 3, prefix = '●' },
        signs = false,
        severity_sort = true,
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
        tsserver = {
          init_options = {
            preferences = {
              disableSuggestions = true,
              jsxAttributeCompletionStyle = 'none',
            },
          },
        },
        jsonls = {},
        eslint = {
          --[[
          on_attach = function (_, bufnr)
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
          --]]
        },
        cssmodules_ls = {},
        html = {},
        cssls = {},
        stylelint_lsp = {},
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--query-driver=/opt/homebrew/bin/arm-none-eabi-*',
            '--function-arg-placeholders=0',
          },
        },
        omnisharp = {},
      }

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require('mason-lspconfig').setup_handlers({
        function (server_name)
          local server_options = servers[server_name]
          require('lspconfig')[server_name].setup(vim.tbl_extend('force', server_options, {
            capabilities = capabilities,
            on_attach = function (client, bufnr)
              client.server_capabilities.semanticTokensProvider = nil
              if server_options.on_attach ~= nil then
                server_options.on_attach(client, bufnr)
              end
              vim.keymap.set('n', '<c-]>', function () vim.lsp.buf.definition() end, { buffer = bufnr })
              vim.keymap.set('n', 'K', function () vim.lsp.buf.hover() end, { buffer = bufnr })
              vim.keymap.set('n', '[d', function () vim.diagnostic.goto_prev() end, { buffer = bufnr })
              vim.keymap.set('n', ']d', function () vim.diagnostic.goto_next() end, { buffer = bufnr })
              vim.keymap.set('i', '<c-h>', function () vim.lsp.buf.signature_help() end, { buffer = bufnr })
            end,
            flags = {
              debounce_text_changes = 150,
            },
          }))
        end,
      })
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    event = { 'InsertEnter' },
    config = function ()
      require('copilot').setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        filetypes = {
          sh = function ()
            local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
            if filename == '.env' or string.sub(filename, 1, 5) == '.env.' then
              return false
            end
            return true
          end,
          ['*'] = true,
        },
      })
    end,
  },
  {
    'smjonas/inc-rename.nvim',
    cmd = { 'IncRename' },
    keys = {
      { '<leader>rn', ':IncRename ' },
    },
    config = function ()
      require('inc_rename').setup()
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    config = function ()
      require('conform').setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = false,
        },
        notify_on_error = true,
        formatters_by_ft = {
          javascript = { { 'prettierd', 'prettier' } },
          javascriptreact = { { 'prettierd', 'prettier' } },
          typescript = { { 'prettierd', 'prettier' } },
          typescriptreact = { { 'prettierd', 'prettier' } },
        },
      })
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('nvim-lightbulb').setup({
        priority = 10,
        hide_in_unfocused_buffer = false,
        action_kinds = { 'quickfix' },
        sign = {
          enabled = false,
        },
        virtual_text = {
          enabled = true,
          text = '',
          hl = 'Yellow',
        },
        autocmd = {
          enabled = true,
          updatetime = -1,
        },
      })
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      { '<leader>la', mode = { 'n', 'v' }, function () require('actions-preview').code_actions() end },
    },
    config = function ()
      require('actions-preview').setup({})
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('gitsigns').setup({
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '▁' },
          topdelete = { text = '▔' },
          changedelete = { text = '┃' },
        },
        attach_to_untracked = false,
      })
    end,
  },
  {
    'nvchad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('colorizer').setup({
        user_default_options = { names = false, mode = 'virtualtext' },
        buftypes = { '!prompt', '!popup', '!mason' },
      })
    end,
  },
  {
    'yioneko/vim-tmindent',
    lazy = true,
    config = function ()
      require('tmindent').setup({
        enabled = function () return true end,
        use_treesitter = function () return true end,
      })
    end,
  },
  { 'pangloss/vim-javascript' },
  { 'maxmellon/vim-jsx-pretty' },
  {
    'lifepillar/pgsql.vim',
    init = function ()
      vim.g.sql_type_default = 'pgsql'
    end,
  },
}
