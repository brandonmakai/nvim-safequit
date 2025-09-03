# nvim-safequit

**Prevent losing unsaved files in Neovim with a safety-first CLI + plugin.**

`nvim-safequit` is a lightweight C++ CLI tool paired with a minimal Neovim plugin that ensures you never accidentally quit a session with multiple unsaved buffers. It’s perfect for power users who edit multiple files at once and want an extra safety net.

---

## Features

- Detect multiple modified buffers before quitting.
- Output results in **JSON**, making it easy to integrate with other tools or scripts.
- Automatic conversion of `:wq` → `:wqa` when multiple buffers are dirty.
- Minimal Neovim plugin for seamless integration.
- Cross-platform support (Linux/macOS/Windows).

---

## Installation

### 1. Build the CLI

```bash
git clone https://github.com/yourusername/nvim-safequit.git
cd nvim-safequit
mkdir build && cd build
cmake ..
make
sudo make install   # optional
```

### 2. Install the Neovim plugin

Copy the Lua plugin to your Neovim config directory:

```bash 
cp lua/safequit.lua ~/.config/nvim/lua/
```

Then add to your init.lua:

```lua
require("safequit")
```

Now the plugin automatically hooks into the QuitPre autocmd.

--- 

## Usage
#### CLI Usage
```bash
# Check specific files
nvim-safequit --files file1.cpp file2.cpp --json

# Scan entire project directory
nvim-safequit --project /path/to/project --json
```


#### Output example:
```json
{
  "dirty": ["file2.cpp"],
  "clean": ["file1.cpp"]
}
```

#### Neovim Integration

Open multiple files in Neovim:
```bash
nvim file1.cpp file2.cpp
```

If you attempt :wq with multiple dirty buffers, the plugin calls the CLI and automatically runs :wqa to prevent data loss.

---

### Contributing
Contributions are welcome!
* Fork the repo.
* Implement features or fix bugs.
* Submit a pull request with clear description and tests.

### License
MIT License. See `LICENSE` for details.

