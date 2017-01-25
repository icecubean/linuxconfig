-- version : 0.1
-- date    : 2007-02-07
-- author  : Klaus Umbach <treibholz@sozial-inkompetent.de>
-- based on author  : Tibor Csögör <tibi@tiborius.net>

-- This style highlights active elements with an `accent' color.  Bright and
-- dimmed variants emphasize the level of importance.  The corresponding neutral
-- colors are (roughly) the non-saturated versions.

-- The author likes the color scheme `gold' best, however, feel free to
-- experiment with the accent color(s).

-- This software is in the public domain.

local my_font = "-*-helvetica-bold-r-normal-*-10-*-*-*-*-*-*-*"
local my_statusbar_font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*"
-- local my_statusbar_font = "-*-arial-*-r-*-*-*-*-*-*-*-*-*-*"
local my_menu_font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*"
local my_notify_font = "-*-helvetica-medium-r-normal-*-18-*-*-*-*-*-*-*"
local my_input_font = "-misc-fixed-medium-r-*-*-13-*-*-*-*-60-*-*"

-- color configuration ---------------------------------------------------------

-- silver
-- local my_accent_color_high   = "white"
-- local my_accent_color_bright = "grey90"
-- local my_accent_color_normal = "grey80"
-- local my_accent_color_dimmed = "grey70"
-- local my_accent_color_dark   = "grey60"
-- local my_accent_color_shadow = "grey50"


-- ClearLooks
--local my_accent_color_high   = "#9db6c8"
--local my_accent_color_bright = "#84a0b4"
--local my_accent_color_normal = "#6c8a9f"
--local my_accent_color_dimmed = "#596e7d"
--local my_accent_color_dark   = "#414c53"
--local my_accent_color_shadow = "#232527"
--local my_accent_fontcolor = "white"

-- gold
--local my_accent_color_high   = "yellow"
--local my_accent_color_bright = "lightgoldenrod1"
--local my_accent_color_normal = "gold1"
--local my_accent_color_dimmed = "gold2"
--local my_accent_color_dark   = "gold3"
--local my_accent_color_shadow = "gold4"
---local my_accent_fontcolor    = "black"

-- ClearLooks
local my_accent_color_high   = "#b2d1f7"
local my_accent_color_bright = "#b0cbec"
local my_accent_color_normal = "#8db0dd"
local my_accent_color_dimmed = "#7499c8"
local my_accent_color_dark   = "#7e8eb5"
local my_accent_color_shadow = "#535557"
local my_accent_fontcolor = "white"



-- green
-- local my_accent_color_bright = "#c2ffc2"
-- local my_accent_color_normal = "palegreen1"
-- local my_accent_color_dimmed = "palegreen2"
-- local my_accent_color_dark   = "palegreen3"

-- blue
--local my_accent_color_bright = "lightblue1"
--local my_accent_color_bright = "lightgoldenrod1"
--local my_accent_color_normal = "skyblue1"
--local my_accent_color_dimmed = "skyblue2"
--local my_accent_color_dark   = "skyblue3"
--local my_accent_color_shadow = "gold4"

-- plum
-- local my_accent_color_bright = "#ffd3ff"
-- local my_accent_color_normal = "plum1"
-- local my_accent_color_dimmed = "plum2"
-- local my_accent_color_dark   = "plum3"

--------------------------------------------------------------------------------


-- neutral colors
local my_neutral_color_high = "#ffffff"
local my_neutral_color_normal = "#ede9e3"
local my_neutral_color_dimmed = "#d9d2c7"
local my_neutral_color_dark   = "#9d9993"
local my_neutral_color_shadow = "#817667"

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
	padding_pixels = 0,
	spacing = 0,
	foreground_colour = "black",
	background_colour = my_accent_color_bright,
	highlight_pixels = 1,
	highlight_colour = my_neutral_color_normal,
	shadow_pixels = 1,
	shadow_colour = my_neutral_color_normal,
	border_style = "elevated",
})

de.defstyle("frame", {
	based_on = "*",
	background_colour = "black",
	bar = "inside",
})

de.defstyle("frame-*", {
	based_on = "frame",
	spacing = 0,
	padding_pixels = 0,
	highlight_pixels = 1,
	highlight_colour = my_neutral_color_dark,
	shadow_pixels = 1,
	shadow_colour = my_neutral_color_shadow,
	de.substyle("active", {
		highlight_colour = my_accent_color_high,
		shadow_colour = my_accent_color_dark,
	}),
})

de.defstyle("frame-floating-alt", {
	spacing = 0,
	padding_pixels = 0,
	highlight_pixels = 0,
	highlight_colour = "yellow",
	shadow_pixels = 0,
	shadow_colour = "yellow",
	bar = "none",
})



de.defstyle("tab-*", {
	based_on = "*",
	spacing = 0,
	padding_pixels = 1,
	highlight_pixels = 1,
	shadow_pixels = 1,
	foreground_colour = my_neutral_color_shadow,
	background_colour = my_neutral_color_dimmed,
	highlight_colour = my_neutral_color_normal,
	shadow_colour = my_neutral_color_dark,
	text_align = "center",
	font = my_font,
	de.substyle("active-selected", {
		foreground_colour = my_accent_fontcolor,
		background_colour = my_accent_color_normal,
		highlight_colour = my_accent_color_high,
		shadow_colour = my_accent_color_dark,
	}),
	de.substyle("active-unselected", {
		foreground_colour = my_accent_color_shadow,
		background_colour = my_accent_color_dark,
		highlight_colour = my_accent_color_normal,
		shadow_colour = my_accent_color_shadow,
	}),
	de.substyle("inactive-selected", {
		foreground_colour = "black",
		background_colour = my_neutral_color_normal,
		highlight_colour = my_neutral_color_high,
		shadow_colour = my_neutral_color_shadow,

	}),
})

de.defstyle("input-edln", {
	based_on = "*",
	padding_pixels = 1,
	foreground_colour = "black",
	background_colour = my_accent_color_normal,
	highlight_pixels = 1,
	highlight_colour = my_accent_color_high,
	shadow_pixels = 1,
	shadow_colour = my_accent_color_dark,
	font = my_input_font,
	de.substyle("*-cursor", {
		foreground_colour = my_accent_color_bright,
		background_colour = "black",
	}),
	de.substyle("*-selection", {
		foreground_colour = my_accent_color_normal,
		background_colour = "black",
	}),
	de.substyle("unselected", {
		background_colour = my_accent_color_dark,
	highlight_colour = my_accent_color_normal,
		shadow_colour = my_accent_color_shadow,
	}),

})

de.defstyle("stdisp", {
	based_on = "*",
	padding_pixels = 0,
	shadow_pixels = 1,
	highlight_pixels = 0,
	background_colour = my_neutral_color_normal,
	highlight_colour = my_neutral_color_high,
	-- shadow_colour = my_neutral_color_shadow,
	shadow_colour = my_neutral_color_normal,
	foreground_colour = "black",
	font = my_statusbar_font,
})

de.defstyle("stdisp-dock", {
	based_on = "*",
	padding_pixels = 0,
	shadow_pixels = 1,
	highlight_pixels = 1,
	background_colour = my_neutral_color_normal,
	highlight_colour = my_neutral_color_high,
	-- shadow_colour = my_neutral_color_shadow,
	shadow_colour = my_neutral_color_shadow,
	foreground_colour = "black",
	font = my_statusbar_font,
})



-- menu-entries
de.defstyle("tab-menuentry", {
	based_on = "*",
	text_align = "left",
	padding_pixels = 2,
	spacing = 0,
	shadow_pixels = 1,
	highlight_pixels = 1,
	font = my_menu_font,
	foreground_colour = "black",
	background_colour = my_neutral_color_normal,
	de.substyle("active-selected", {
		background_colour = my_accent_color_high,
	}),
	de.substyle("inactive-selected", {
		background_colour = my_accent_color_dimmed,
	}),

})

-- menu itself
de.defstyle("input-menu", {
		background_colour = my_accent_color_high,
	based_on = "*",
	padding_pixels = 0,
	spacing = 0,
	shadow_pixels = 1,
	highlight_pixels = 1,
	highlight_colour = my_neutral_color_high,
	shadow_colour = my_neutral_color_shadow,
})



de.defstyle("actnotify", {
	based_on = "*",
	padding_pixels = 1,
	highlight_pixels = 1,
	highlight_colour = my_accent_color_normal,
	shadow_pixels = 1,
	shadow_colour = my_accent_color_normal,
	background_colour = "red",
	foreground_colour = "white",
	font = my_notify_font,
})

gr.refresh()

-- EOF
