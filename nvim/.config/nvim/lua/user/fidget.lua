local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
    vim.notify("fidget failed to load")
    return
end
fidget.setup{}
