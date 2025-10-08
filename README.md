# My Neovim Configuration

This is a personalized Neovim configuration based on Lua. It uses `lazy.nvim` for plugin management and is structured to be modular and easy to maintain.

## Installation

1.  Remove old neovim configuration: 
    ```bash
    rm -rf ~/.cache/nvim ~/.local/state/nvim ~/.local/share/nvim ~/.config/nvim
    ```
2.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/your-username/your-repo-name.git ~/.config/nvim
    ```
3.  Start Neovim. `lazy.nvim` will automatically install the plugins.

## Plugins

This configuration uses the following plugins:

-   **[lazy.nvim](https://github.com/folke/lazy.nvim):** A modern plugin manager for Neovim.
-   **[darcubox-nvim](https://github.com/Koalhack/darcubox-nvim):** A dark colorscheme.
-   **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim):** Git decorations for the sign column.
-   **[mini.nvim](https://github.com/echasnovski/mini.nvim):** A collection of minimal plugins, including `mini.starter` for a startup screen, `mini.icons` for icons, and `mini.bufremove` for buffer management.
-   **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim):** A file explorer.
-   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** For syntax highlighting and more.
-   **[which-key.nvim](https://github.com/folke/which-key.nvim):** Displays available keybindings.

## Keybindings

The leader key is set to `space`.

### Core Mappings

| Keybinding | Description                  |
| :--------- | :--------------------------- |
| `<C-d>`    | Scroll down, keeping cursor centered |
| `<C-u>`    | Scroll up, keeping cursor centered   |
| `n`        | Next search result, centered |
| `N`        | Previous search result, centered |
| `<C-q>`    | Force quit                   |
| `<`        | Un-indent in visual mode     |
| `>`        | Indent in visual mode        |
| `p`        | Paste without yanking        |
| `P`        | Paste without yanking        |
| `]b`       | Next buffer                  |
| `[b`       | Previous buffer              |

### Buffer Mappings

| Keybinding | Description |
| :--- | :--- |
| `<leader>bc` | Close all buffers except current |
| `<leader>bC` | Close all buffers |
| `c` | Close current buffer |

### Git Mappings

The git prefix is `<leader>g`.

| Keybinding | Description          |
| :--------- | :------------------- |
| `<leader>gp` | Preview git hunk     |
| `<leader>gr` | Reset hunk           |
| `<leader>gR` | Reset Git buffer     |
| `[G`       | First Git hunk       |
| `]G`       | Last Git hunk        |
| `]g`       | Next git hunk        |
| `[g`       | Previous git hunk    |

### Neo-tree Mappings

| Keybinding  | Description       |
| :---------- | :---------------- |
| `<leader>e` | Toggle neo-tree   |

### Which-key Mappings

| Keybinding  | Description                     |
| :---------- | :------------------------------ |
| `<leader>?` | Show buffer local keymaps |
