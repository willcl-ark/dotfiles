-- Create a new split, focus it and return the bufnr
local function NewSplit()
    vim.cmd('split')
    local win = vim.api.nvim_get_current_win()
    local result_buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, result_buf)
    return result_buf
end

-- Runs the current file if it is executable
local function RunFile()
    local filename = vim.api.nvim_buf_get_name(0)
    local result_buf = NewSplit()

    -- function to write stdout/err to the new split
    local append_data = function(_, data)
      if data then
        vim.api.nvim_buf_set_lines(result_buf, -1, -1, false, data)
      end
    end

    -- Run the actual job
    vim.fn.jobstart({ "python", filename }, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
    })
end

-- Add it as an autocommand
-- TODO: make it work for other filetypes
vim.api.nvim_create_user_command('RunPython', RunFile, {})
