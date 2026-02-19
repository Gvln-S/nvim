# Gvln-S Neovim Configuration

A comprehensive, modular, and performance-oriented **Neovim** configuration built with **Lazy.nvim**.

This configuration is designed for **Full Stack Development** (Java, Web, Python) and **Systems Programming** (C++, Bash), featuring a beautiful UI with **Catppuccin**, robust LSP integration via **Mason**, and seamless Git integration.

![Neovim](https://img.shields.io/badge/Neovim-0.9+-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-Config-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Lazy](https://img.shields.io/badge/Lazy.nvim-Manager-3178C6?style=for-the-badge&logo=lua&logoColor=white)

## Features

- ** Package Management**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup times.
- ** LSP Support**: Auto-configured Language Servers for Java, C++, Python, Lua, TypeScript, HTML, CSS, Bash, and more using [Mason](https://github.com/williamboman/mason.nvim).
- ** Advanced Java Support**: Dedicated `jdtls` setup with debugging, refactoring, and Maven/Gradle support.
- ** UI & Aesthetics**:
  - **Theme**: Catppuccin (Transparent background).
  - **Status Line**: Lualine configured with git status and diagnostics.
  - **Dashboard**: Custom startup screen with quick access keys.
  - **File Explorer**: Neo-tree with git integration and icons.
- ** Navigation**: Telescope for fuzzy finding files, buffers, and text.
- ** Syntax Highlighting**: Tree-sitter for better syntax highlighting and context.
- ** Formatting & Linting**: `none-ls` integration for Prettier and StyLua.
- ** LaTeX**: Windows-optimized setup with VimTex and SumatraPDF support.

##  Prerequisites

Before installing, ensure you have the following installed on your system:

- **Neovim** (v0.9.0 or later)
- **Git**
- **A Nerd Font** (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)) for icons.
- **Ripgrep** (required for Telescope live grep).
- **C Compiler** (GCC or Clang, required for Tree-sitter parsers).

### Language Specific Requirements
- **Java**: JDK 17 or higher (Config defaults to JDK 23).
- **Node.js & npm**: Required for installing Mason packages (LSP/Formatters).
- **Windows Users**:
  - **LLVM/Clang**: For C++ support (Config expects `C:\Program Files\LLVM\bin`).
  - **SumatraPDF**: For LaTeX preview.

## Installation

1.  **Clone the repository:**
    ```bash
    # Windows (PowerShell)
    git clone [https://github.com/Gvln-S/nvim](https://github.com/Gvln-S/nvim) $env:LOCALAPPDATA\nvim

    # Linux / MacOS
    git clone [https://github.com/Gvln-S/nvim](https://github.com/Gvln-S/nvim) ~/.config/nvim
    ```

2.  **Start Neovim:**
    Open `nvim`. `lazy.nvim` will automatically bootstrap and install all plugins. Restart Neovim once the installation is complete.

## Important Configuration Required

**Windows Users:**
This configuration contains hardcoded paths specific to the original author's machine. You **must** update these files to match your system paths for these features to work:

1.  **Java (JDTLS):**
    * Open `ftplugin/java.lua`.
    * Update the `path` in the `runtimes` section to point to your JDK installation (currently set to `C:\\Program Files\\Java\\jdk-23`).
    * Ensure the `mason_path` points to your correct user directory if necessary.

2.  **LaTeX (Vimtex):**
    * Open `lua/plugins/nvim-vimtex.lua`.
    * Update `vim.g.vimtex_view_general_viewer` to point to your SumatraPDF executable (currently `C:/Users/Gvln-S/AppData/...`).

3.  **C++ (Clangd):**
    * Open `lua/plugins/lsp-config.lua`.
    * Check the `clangd` setup. It points to `C:/msys64/mingw64/bin/clangd.exe`. Adjust this if you use a different compiler path or LLVM.

## Keymaps

The **Leader key** is set to `Space`.

### General
| Key | Description |
| --- | --- |
| `<C-h/j/k/l>` | Navigate between splits |
| `<leader>wqa` | Save all and quit |
| `<leader>ww` | Save current file |
| `<leader>sx` | Close split |
| `<leader>sh/sl` | Resize split (width) |
| `<leader>sj/sk` | Resize split (height) |

### File Management (Neo-tree)
| Key | Description |
| --- | --- |
| `<leader>m` | Open File Explorer (Left) |
| `<leader>n` | Close File Explorer |

### Telescope (Search)
| Key | Description |
| --- | --- |
| `<leader>tff` | Find files |
| `<leader>tfw` | Live grep (find text) |
| `<leader>tfb` | Find open buffers |
| `<leader>trf` | Recent files |

### LSP & Code
| Key | Description |
| --- | --- |
| `K` | Hover documentation |
| `<leader>df` | Go to definition |
| `<leader>rf` | Find references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>gf` | Format file (Prettier/Stylua) |

### Java Specific
| Key | Description |
| --- | --- |
| `<leader>oi` | Organize imports |
| `<leader>ev` | Extract variable |
| `<leader>em` | Extract method |

### Git
| Key | Description |
| --- | --- |
| `<leader>fg` | Open Git Graph (Flog) |
| `<leader>gb` | Toggle Git Blame |

## Plugin Structure

The configuration is organized into modules:
* `lua/core/`: Basic Vim options and global keymaps.
* `lua/plugins/`: Individual plugin configurations managed by Lazy.
    * `lsp-config.lua`: Main LSP setup (Mason).
    * `nvim-cmp.lua`: Autocompletion engine.
    * `tree-sitter.lua`: Syntax highlighting.
    * `nvim-telescope.lua`: Fuzzy finder.
    * `nvim-neoTree.lua`: File explorer.
    * ...and others.

## License

[MIT](https://choosealicense.com/licenses/mit/)
