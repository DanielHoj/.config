-- Add, Change, Delete Surrounding Chars (["''"])
--The three "core" operations of add/delete/change can be done with the keymaps
--ys{motion}{char},
--ds{char},
--and cs{target}{replacement},
-- For the following examples, * will denote the cursor position:
--Old text                    Command         New text
----------------------------------------------------------------------------------
--surr*ound_words             ysiw)           (surround_words)
--*make strings               ys$"            "make strings"
--[delete ar*ound me!]        ds]             delete around me!
--remove <b>HTML t*ags</b>    dst             remove HTML tags
--'change quot*es'            cs'"            "change quotes"
--<b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--delete(functi*on calls)     dsf             function calls
-- S in visual mode

return {
  -- https://github.com/kylechui/nvim-surround
  'kylechui/nvim-surround',
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        visual = "<leader>s",
        visual_line = "<leader>S",
      }
    })
  end,
  opts = {}
}
