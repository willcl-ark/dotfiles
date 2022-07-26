local status_ok, solarized = pcall(require, "solarized")
if not status_ok then
    return
end
solarized.set()
