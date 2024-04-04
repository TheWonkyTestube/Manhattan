require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
	  all = {

		rosewater 	= "#fff5d8",
		flamingo 	= "#e0b091",
		pink	    = "#bf6969",
		mauve	    = "#8a255f",
		red	        = "#c91d37",
		maroon	    = "#5a2c39",
		peach	    = "#f5540c",
		yellow	    = "#fbba20",
		green	    = "#24b298",
		teal	    = "#00898c",
		sky	        = "#007a8a",
		sapphire 	= "#006b84",
		blue	    = "#005b7d",
		lavender 	= "#8cd0d9",

		text	    = "#aeeefa",
		subtext1 	= "#9dd7e5",
		subtext0 	= "#8dc0d1",
		overlay2 	= "#7daabc",
		overlay1 	= "#6e94a7",
		overlay0 	= "#5f7f91",
		surface2 	= "#516a7c",
		surface1 	= "#435768",
		surface0 	= "#354453",

		base	    = "#0C101B",
		mantle	    = "#0C101B",
		crust	    = "#0C101B",

	  }
	},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
    },
})
