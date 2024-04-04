require('bufferline').setup{
  options = {
	indicator = {
	  style = 'underline',
	},
	mode 					 = 'tabs',
	numbers					 = "ordinal",
	color_icons				 = true,
	show_buffer_icons		 = true,
	show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
	separator_style	= {
	  '',
	  '',
	},
  }
}

