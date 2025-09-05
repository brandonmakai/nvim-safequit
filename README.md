# nvim-safequit

**Prevent losing unsaved files in Neovim with a lightweight plugin.**

`nvim-safequit` is a minimal Neovim plugin that ensures you never accidentally quit a session with multiple unsaved buffers. It’s perfect for power users who edit multiple files at once and want an extra safety net.

---

## Features

- Detect multiple modified buffers before quitting.
- Automatically convert :wq → :wqa when multiple buffers are dirty.
- Minimal, fully integrated Neovim plugin.
- Cross-platform support (Linux/macOS/Windows) via Neovim.

---

## Installation

### 1. Clone the repo

```bash
git clone https://github.com/brandonmakai/safequit.nvim.git
```

### 2. Install the Neovim plugin

Copy the Lua plugin to your Neovim config directory:

```bash 
cd safequit.nvim && cp lua/safequit/init.lua ~/.config/nvim/lua/
```

Then add to your init.lua:

```lua
require("safequit").setup()
```

Now the plugin automatically hooks into the QuitPre autocmd.

--- 

#### Usage

Open multiple files in Neovim:
```bash
nvim file1.cpp file2.cpp
```

If you attempt `:wq` with multiple dirty buffers, the plugin automatically detects unsaved changes and runs `:wqa` to prevent data loss. No additional configuration is needed.

---

### Contributing
Contributions are welcome!
* Fork the repo.
* Implement features or fix bugs.
* Submit a pull request with clear description and tests.

### License
MIT License. See `LICENSE` for details.

