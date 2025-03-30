<br />
<div align="center">
  <h3 align="center">Cheat Menu User Interface</h3>

  <p align="center">
    A user interface that supports roblox script executor lua. 
    <br />
    <br />
    <a href="https://raw.githubusercontent.com/Reload-astro/onetap-menu-lib/refs/heads/main/example.lua">View Demo</a>
  </p>

  <div align="center">
    <img src="https://github.com/Reload-astro/onetap-menu-lib/blob/main/assets/preview.png?raw=true" alt="Preview" />
  </div>
</div>

## Getting Started

This will go through how to use the library in your executor should work on all.

### Prerequisites

This is how you import the library through the repository.
* Example:
  ```lua
  -- EXTRA INFO: You can modify this library its open source. The code is horrendous but have fun.
  -- In order to make configs of your own make the inactivity text your own text you want
  -- I may implement theming etc in the future if i come back to this. 
  
  local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reload-astro/onetap-menu-lib/refs/heads/main/library.lua"))({
    cheatname = 'Cheat Name',
    gamename = 'Game Name',
    color = Color3.fromRGB(255, 141, 34)
  })
  local flags = library.flags -- access flags from here.
  ```

### Elements

* Window
  ```lua
  local window = library:window({
    name = "Cheat Name", 
    size = UDim2.fromOffset(500, 650) -- x, y in size
  })
  ```

* Tab
  ```lua
  local tab = window:tab({name = "Page"})
  ```

* Section
  ```lua
  local section = tab:section({
    name = "Section",
  })
  ```

* Toggle:
   ```lua
  section:toggle({
      name = "Example Toggle",
      flag = "example_toggle",
      default = false,
      callback = function(bool)
          print(bool)
          print(flags["example_toggle"])
      end,
  })
   ```

* Dropdown
  ```lua
  section:dropdown({
      name = "Example Dropdown", 
      flag = "example_dropdown", 
      items = {"One", "Two", "Three"}, 
      multi = false, 
      callback = function(option)
          print(option) -- Will return a table if you set multi to true, allowing you to select multiple items
          print(flags["example_dropdown"])
      end
  })
  ```

* Slider
  ```lua
  section:slider({
      name = "Example Slider", 
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
  ```

* Colorpicker
  ```lua
  section:colorpicker({
    name = "Example Colorpicker",
    flag = "example_colorpicker",
    color = Color3.new(1, 1, 1),
    callback = function(color, alpha)
        print(color, alpha)
        print(flags["example_colorpicker"].Color, flags["example_colorpicker"].Transparency)
    end
  })
  ```

* Keybinds
  ```lua
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
  ```

* Configs/Settings
  ```lua
  library:CreateConfigTab(window)
  ```

* Open Tab
  ```lua
  library:CreateConfigTab(window)
  ```

* Unload Callback
  ```lua
  library.unload_callback = function()
      print('unloaded cheat menu')
  end
  ```
