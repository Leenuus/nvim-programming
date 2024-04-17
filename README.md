# Play with Neovim API

## Treesitter

Play with treesitter to write some fancy snippets and keybindings

- [ ] A simple plugin to inspect object with printing in some programming langauges
- [ ] Write a simple plugin to convert json data to some language's structure/dict/table

## Window/Buffer

Play with window/buffer api to integrate some routines into neovim, like RSS feeds reading, or even searching

- [ ] Modify `oil.nvim` code, making it support open file buffer in floating window, split window natively
- [ ] write a RSS feed reader frontend with Neovim API

### Close Window Quicks

*window only*
- `close`, only close window, which won't fail
- `q`, close window, fail when it is the last window

#### buffer only

Behavior can be changed with `<range>` prefix

- `w`, save buffer, fail when it is the last window

#### window and buffer

- `x`, save buffer if it is changed, and then close window


### `vim.api.nvim_`
