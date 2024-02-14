local wezterm = require("wezterm")
return {
	font = wezterm.font_with_fallback({
		{ family = "FiraCode Nerd Font" },
		{ family = "Hiragino Kaku Gothic Pro" }, -- ヒラギノフォント
	}),
	font_rules = {
		-- For Bold-but-not-italic text, use this relatively bold font, and override
		-- its color to a tomato-red color to make bold text really stand out.
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font_with_fallback({
				{ family = "FiraCode Nerd Font", weight = "Bold" },
				{ family = "Hiragino Kaku Gothic Pro", weight = "Bold" }, -- ヒラギノフォント
			}),
		},

		-- Bold-and-italic
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				{ family = "FiraCode Nerd Font", weight = "Bold", style = "Normal" },
				{ family = "Hiragino Kaku Gothic Pro", weight = "Bold", style = "Normal" }, -- ヒラギノフォント
			}),
		},

		-- normal-intensity-and-italic
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font_with_fallback({
				{ family = "FiraCode Nerd Font Light", weight = "Light", style = "Normal" },
				{ family = "Hiragino Kaku Gothic Pro", weight = "Light", style = "Normal" }, -- ヒラギノフォント
			}),
		},

		-- half-intensity-and-italic (half-bright or dim); use a lighter weight font
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font_with_fallback({
				{ family = "FiraCode Nerd Font Light", weight = "Light" },
				{ family = "Hiragino Kaku Gothic Pro", weight = "Light" }, -- ヒラギノフォント
			}),
		},

		-- half-intensity-and-not-italic
		{
			intensity = "Half",
			italic = false,
			font = wezterm.font_with_fallback({
				{ family = "FiraCode Nerd Font Light", weight = "Light" },
				{ family = "Hiragino Kaku Gothic Pro", weight = "Light" }, -- ヒラギノフォント
			}),
		},
	},
}
