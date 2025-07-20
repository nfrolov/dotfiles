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
          vim.api.nvim_set_hl(0, '@markup.link.label.astro', {})
          vim.api.nvim_set_hl(0, '@string.special.url.html', {})
          vim.api.nvim_set_hl(0, '@string.special.url.astro', {})
          vim.api.nvim_set_hl(0, '@tag.javascript', { link = '@type' })
          vim.api.nvim_set_hl(0, '@tag.typescript', { link = '@type' })
          vim.api.nvim_set_hl(0, '@tag.tsx', { link = '@type' })
          vim.api.nvim_set_hl(0, '@tag.builtin.javascript', { link = '@tag' })
          vim.api.nvim_set_hl(0, '@tag.builtin.typescript', { link = '@tag' })
          vim.api.nvim_set_hl(0, '@tag.builtin.tsx', { link = '@tag' })
          vim.api.nvim_set_hl(0, '@keyword.import.javascript', { link = '@keyword' })
          vim.api.nvim_set_hl(0, '@keyword.import.typescript', { link = '@keyword' })
          vim.api.nvim_set_hl(0, '@keyword.import.tsx', { link = '@keyword' })
          vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {})
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
    dependencies = {
      'tpope/vim-repeat',
    },
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
    cond = vim.fn.argc() == 0,
    config = function ()
      require('persistence').setup({ need = 0, branch = false })
      vim.schedule(require('persistence').load)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'astro',
          'c',
          'c_sharp',
          'cmake',
          'css',
          'html',
          'javascript',
          'jsdoc',
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
        indent = {
          enable = false,
        },
        playground = {
          enable = true,
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
        max_lines = 0,
        multiline_threshold = 1,
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
      { '<leader><leader>', function () require('telescope.builtin').resume() end },
      { '<c-p>', function () require('telescope.builtin').git_files() end },
      { '<leader>ff', function () require('telescope.builtin').find_files() end },
      { '<leader>fo', function () require('telescope.builtin').oldfiles({ cwd = vim.loop.cwd() }) end },
      { '<leader>fh', function () require('telescope.builtin').help_tags() end },
      {
        '<leader>fg',
        function ()
          require('telescope.builtin').live_grep({
            default_text = vim.fn.expand('<cword>'),
          })
        end,
      },
      { '<leader>fb', function () require('telescope').extensions.file_browser.file_browser() end },
      {
        '<leader>rr',
        function ()
          require('telescope.builtin').lsp_references({
            include_current_line = true,
            jump_type = 'never',
          })
        end,
      },
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
              ['<tab>'] = actions.move_selection_next,
              ['<s-tab>'] = actions.move_selection_previous,
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
          find_files = {
            theme = 'dropdown',
            layout_config = {
              width = 120,
              height = 30,
            },
          },
          oldfiles = {
            theme = 'dropdown',
          },
          live_grep = {
            theme = 'dropdown',
            layout_config = {
              width = 120,
              height = 30,
            },
            preview = true,
          },
          lsp_references = {
            theme = 'dropdown',
            layout_config = {
              width = 0.8,
              height = 20,
            },
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
            {
              'buffers',
              show_filename_only = false,
              max_length = function () return vim.o.columns end,
              symbols = { modified = '+' },
            },
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
    },
    event = { 'InsertEnter' },
    config = function ()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function (args)
            vim.snippet.expand(args.body)
          end,
        },
        completion = {
          -- keyword_length = 3,
        },
        mapping = {
          ['<tab>'] = cmp.mapping(
            function (fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = 'select' })
              elseif vim.snippet.active({ direction = 1 }) then
                vim.schedule(function () vim.snippet.jump(1) end)
              else
                fallback()
              end
            end,
            { 'i', 's' }
          ),
          ['<s-tab>'] = cmp.mapping(
            function (fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = 'select' })
              elseif vim.snippet.active({ direction = -1 }) then
                vim.schedule(function () vim.snippet.jump(-1) end)
              else
                fallback()
              end
            end,
            { 'i', 's'}
          ),
          ['<cr>'] = cmp.mapping.confirm({ select = false }),
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
          ['<c-y>'] = cmp.mapping.confirm({ select = false }),
          ['<c-e>'] = cmp.mapping.abort(),
        },
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
        }),
      })
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function ()
          require('mason').setup({})
        end,
        build = ':MasonUpdate',
      },
      'neovim/nvim-lspconfig',
      {
        'j-hui/fidget.nvim',
        config = function ()
          require('fidget').setup({})
        end,
      },
      'hoffs/omnisharp-extended-lsp.nvim'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      vim.diagnostic.config({
        underline = true,
        update_in_insert = true,
        virtual_text = { spacing = 3, prefix = '●' },
        signs = false,
        severity_sort = true,
      })

      local servers = {
        astro = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              diagnostics = {
                disable = {
                  'missing-fields',
                },
              }
            },
          },
        },
        ts_ls = {
          init_options = {
            preferences = {
              disableSuggestions = true,
              jsxAttributeCompletionStyle = 'none',
            },
          },
        },
        jsonls = {},
        eslint = {},
        cssmodules_ls = {},
        html = {},
        cssls = {},
        stylelint_lsp = {},
        tailwindcss = {},
        clangd = {
          cmd = {
            'clangd',
            '--compile-commands-dir=build',
            '--background-index',
            '--query-driver=/opt/homebrew/bin/arm-none-eabi-*',
            '--function-arg-placeholders=0',
            '-j=16',
          },
        },
        omnisharp = {
          handlers = {
            ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
            ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
            ['textDocument/references'] = require('omnisharp_extended').references_handler,
            ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
          }
        },
      }

      require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      for server_name, server_config in pairs(servers) do
        if not vim.tbl_isempty(server_config) then
          vim.lsp.config(server_name, server_config)
        end
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function (ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = { 'lua' },
    config = function ()
      require('lazydev').setup({})
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
          ['*'] = function ()
            local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
            if filename == '.env' or string.sub(filename, 1, 5) == '.env.' then
              return false
            end
            return true
          end,
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
      require('inc_rename').setup({})
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
        },
        notify_on_error = true,
        notify_no_formatters = true,
        formatters_by_ft = {
          astro = { 'prettierd', 'prettier', stop_after_first = true },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          json = { 'prettierd', 'prettier', stop_after_first = true },
          html = { 'prettierd', 'prettier', stop_after_first = true },
        },
        formatters = {
          prettierd = {
            require_cwd = true,
            env = {
              PRETTIERD_LOCAL_PRETTIER_ONLY = 'true',
            },
          },
          prettier = {
            require_cwd = true,
          },
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
      { '<leader>ra', mode = { 'n', 'v' }, function () require('actions-preview').code_actions() end },
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
        signs_staged_enable = false,
        attach_to_untracked = false,
        on_attach = function (bufnr)
          local gs = require('gitsigns')
          vim.keymap.set('n', ']c', function () gs.nav_hunk('next', { wrap = false }) end, { buffer = bufnr })
          vim.keymap.set('n', '[c', function () gs.nav_hunk('prev', { wrap = false }) end, { buffer = bufnr })
        end,
      })
    end,
  },
  {
    'nvchad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('colorizer').setup({
        user_default_options = { names = false, mode = 'virtualtext' },
        buftypes = { '!prompt', '!popup', '!mason', '!nofile' },
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
  { 'cfdrake/vim-pbxproj' },
}
