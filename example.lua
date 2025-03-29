-- EXTRA INFO: You can modify this library its open source. The code is horrendous but have fun.
-- In order to make configs of your own make the inactivity text your own text you want
-- I may implement theming etc in the future if i come back to this. 

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reload-astro/onetap-menu-lib/refs/heads/main/library.lua"))({
  cheatname = 'Cheat Name',
  gamename = 'Game Name',
  color = Color3.fromRGB(255, 141, 34)
})
local flags = library.flags -- access flags from here.

local window = library:window({
  name = "Cheat Name", 
  size = UDim2.fromOffset(500, 650) -- x, y in size
})

local tab = window:tab({name = "Page"})

local section = tab:section({
  name = "Section",
})

section:toggle({
    text = "Example Toggle",
    flag = "example_toggle",
    default = false,
    callback = function(bool)
        print(bool)
        print(flags["example_toggle"])
    end,
})

section:dropdown({
    text = "Example Dropdown", 
    flag = "example_dropdown", 
    items = {"One", "Two", "Three"}, 
    multi = false, 
    callback = function(option)
        print(option) -- Will return a table if you set multi to true, allowing you to select multiple items
        print(flags["example_dropdown"])
    end
})

section:slider({
    text = "Example Slider", 
    suffix = "%", 
    flag = "example_slider", 
    default = 90, 
    min = 0, 
    max = 100, 
    interval = 0.5,
    callback = function(num)
        print(num)
    end
})

section:colorpicker({
  text = "Example Colorpicker",
  flag = "example_colorpicker",
  color = Color3.new(1, 1, 1),
  callback = function(color, alpha)
      print(color, alpha)
      print(flags["example_colorpicker"].Color, flags["example_colorpicker"].Transparency)
  end
})

-- to get the active state of the keybind from flags use ".active".
section:keybind({
  text = "Example Keybind",
  flags = "example_keybind",
  mode = 'toggle',
  bind = 'Q',
  callback = function(bool)
      print(bool)
  end
})

library:CreateConfigTab(window)

tab:open_tab()