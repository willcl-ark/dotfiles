local status_ok, _ = pcall(require, "synthwave84")
if not status_ok then
    vim.notify("synthwave failed to load")
    return
end
vim.cmd[[colorscheme synthwave84]]
