# gitignore.nvim

Plugin to generate gitignore files based on [github/gitignore](https://github.com/github/gitignore).

## Installation

With [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
{
    "bwpge/gitignore.nvim",
    config = true,
    command = "Gitignore",
}
```

When first installing, you may choose to run `Gitignore build` (see **Usage**).

## Usage

This plugin provides a single command, `Gitignore`:

```
:Gitignore[!] NAME [PATH]
:Gitignore build
```

### `:Gitignore[!] NAME [PATH]`

Writes a gitignore file to optionally specified `PATH`.

- `NAME`: The name of the gitignore to use (e.g., Lua, Python, C++, etc.)
- `PATH`: (optional) output gitignore file, default is `.gitignore`
- If `!` is provided, the target file is opened for editing using `:e <file>`

### `Gitignore build`

Builds the completion list by querying GitHub's API for `gitignore` files in [github/gitignore](https://github.com/github/gitignore).

This isn't required since a default list is provided in `lib.lua`. However, it is useful if you want to update the completion list to match what is in the repo.
