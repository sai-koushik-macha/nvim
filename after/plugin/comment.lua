local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

comment.setup({
    opleader = {
        line = "gc",
        block = "gb",
    },
    mappings = {
        basic = true,
        extra = true,
    },
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    pre_hook = nil,
    post_hook = nil,
    ignore = nil,
})

local comment_ft = require("Comment.ft")
comment_ft.set("lua", { "--%s", "--[[%s]]" })
