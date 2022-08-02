local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    vim.notify("Comment failed to load")
    return
end

comment.setup()
