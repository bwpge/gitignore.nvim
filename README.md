# gitignore.nvim

Plugin to generate gitignore files based on [github/gitignore](https://github.com/github/gitignore).

## Installation

With [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
{
    "bwpge/gitignore.nvim",
    opts = {},
    command = "Gitignore",
}
```

When first installing, you may want to build the completion list (see **Usage**).

## Configuration

```lua
opts = {
    -- customize command for opening gitignore file after writing
    open_cmd = "vert split"
}
```

## Usage

This plugin provides a single command, `Gitignore`:

```
:Gitignore[!] [--path|-p PATH] NAME [NAME...]
:Gitignore --build|-b
```

### `:Gitignore[!] [--path|-p PATH] NAME [NAME...]`

Writes a gitignore file to optionally specified `PATH`.

- `--path|-p PATH`: (optional) specify gitignore output file (default is `.gitignore`)
- `NAME [NAME...]`: The name of the gitignore to use (e.g., Lua, Python, C++, etc.). Can be specified multiple times to concatenate multiple gitignores.
- `!`: Overwrite output gitignore file if it already exists

### `Gitignore --build|-b`

Builds the completion list by querying GitHub's API for `gitignore` files in [github/gitignore](https://github.com/github/gitignore).

This isn't required since a default list is provided. However, it is useful if you want to update the completion list to match what is in the repo without updating this plugin.
