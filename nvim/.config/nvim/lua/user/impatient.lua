local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
    vim.notify("impatient failed to load")
  return
end

impatient.enable_profile()
