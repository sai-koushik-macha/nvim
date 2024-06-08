local M = {}

local group = vim.api.nvim_create_augroup("AutoSaveRun", { clear = true })

M.attach_to_buffer = function(output_bufnr, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = pattern,
        callback = function()
            vim.api.nvim_buf_set_lines(
                output_bufnr,
                0,
                -1,
                false,
                { "output: " }
            )
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(
                        output_bufnr,
                        -1,
                        -1,
                        false,
                        data
                    )
                end
            end

            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end

return M
