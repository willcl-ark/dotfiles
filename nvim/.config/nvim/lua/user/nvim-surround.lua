local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    vim.notify("nvim-surround failed to load")
    return
end


surround.setup({})
