-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- enable comment
comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = 'gc',
    ---Block-comment toggle keymap
    block = 'gb',
  },
  opleader = {
    ---Line-comment keymap
    line = 'gc',
    ---Block-comment keymap
    block = 'gb',
  },
})
