-- Pull in the wezterm API
local wezterm = require 'wezterm'

font = wezterm.font_with_fallback({
  { family = "HackGen Console" },
  { family = "HackGen Console NF", assume_emoji_presentation = true },
})

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- フォントサイズの設定
config.font_size = 16
-- リガチャを無効に
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

if wezterm.target_triple == 'x86_64-apple-darwin' then
  { mods = "CTRL", key = "q", action=wezterm.action{ SendString="\x11" } },
end

-- and finally, return the configuration to wezterm
return config
