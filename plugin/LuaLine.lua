local colors = {
  red = '#c91d37',
  grey = '#435768',
  black = '#1a212d',
  dark_black = '#0C101B',
  white = '#aeeefa',
  light_green = '#94e2d5',
  orange = '#f5540c',
  green = '#00898c',
  blue = '#007a8a',
}

local function getWords()
  return tostring(vim.fn.wordcount().words)
end

local theme = {
  normal = {
    a = { fg = colors.blue, bg = colors.black },
    b = { fg = colors.green, bg = colors.black },
    c = { fg = colors.orange, bg = colors.black },
    z = { fg = colors.orange, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.green, bg = colors.blue } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
	disabled_filetypes = { 'markdown',     -- Filetypes to disable lualine for.
	  statusline = {'markdown'},       -- only ignores the ft for statusline.
	  winbar = {'markdown'},           -- only ignores the ft for winbar.
  },globalstatus = true,
  },
  sections = process_sections {
    lualine_a = { {'mode' , fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {
	  {
		'windows',
		windows_color = {
		  active = { fg = colors.green, bg = colors.dark_black },
		  inactive = { fg = colors.white, bg = colors.black },
		},
	  },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.dark_black } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.dark_black } },
      },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_x = {},
    lualine_y = { search_result, getWords, {'filetype', icons_enabled = true} },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
  },
}
