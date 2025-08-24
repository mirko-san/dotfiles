-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

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

-- WIndowsのときのみの設定
-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'bash' }
end

config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

if wezterm.target_triple == 'x86_64-apple-darwin' then
  config.keys = {
    { mods = "CTRL", key = "q", action=wezterm.action{ SendString="\x11" } },
  }
end

-- https://wezfurlong.org/wezterm/config/mouse.html#gotcha-on-binding-an-up-event-only
config.mouse_bindings = {
  -- Bind 'Up' event of CTRL-Click to open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.Nop,
  },
}

-- and finally, return the configuration to wezterm
return config
