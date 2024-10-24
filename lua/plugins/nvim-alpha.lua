return {

  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "doom",
      config = {
        header = {
          '',
          '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
          '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
          '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
          '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
          '          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
          '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
          '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
          ' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
          ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
          '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
          '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
          '',
        },
        center = {
          {
            icon = '',
            desc = 'Telescope file browser',
            key = 'Space F F',
            key_format = ' [%s]',
            action = ':Telescope find_files',
          },
          {
            icon = '',
            desc = 'Telescope find word',
            key = 'Space F W',
            key_format = ' [%s]',
            action = ':Telescope live_grep',
          },
          {
            icon = '',
            desc = 'Telescope recent files',
            key = 'Space R F',
            key_format = ' [%s]',
            action = ':Telescope oldfiles',
          },
          {
            icon = '',
            desc = 'Neotree Reveal',
            key = 'Space M',
            key_format = ' [%s]',
            action = ':Neotree reveal left',
          },
          {
            icon = '',
            desc = 'New file',
            key = ':enew',
            key_format = ' [%s]',
            action = ':enew',
          },

        },
        footer = {},
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

