require('nvim-tree').setup()
require('formatter').setup {
  ['*'] = {
    require('formatter.filetypes.any').remove_trailing_whitespace
  }
}
require('ayu').colorscheme()
require('lualine').setup {
  options = {
    theme = 'ayu_dark',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' }
  }
}
require('nvim-reload')
require('bufferline').setup {
  options = {
    right_mouse_command = '',
    middle_mouse_command = 'bdelete! %d',
    show_close_icon = false,
  }
}
require('Comment').setup()
require('vgit').setup()
