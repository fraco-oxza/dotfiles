return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation: move between git hunks
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next") -- Go to next git change
          end
        end, { desc = "Next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev") -- Go to previous git change
          end
        end, { desc = "Previous git hunk" })

        -- Actions: stage and reset hunks
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage current hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset current hunk" })

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- Stage selected hunk
        end, { desc = "Stage selected hunk" })

        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- Reset selected hunk
        end, { desc = "Reset selected hunk" })

        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true }) -- Show full blame information
        end, { desc = "Show full line blame" })

        map("n", "<leader>hd", gitsigns.diffthis, { desc = "Show file diff" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~") -- Diff against previous commit
        end, { desc = "Diff against previous commit" })

        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all") -- Add all hunks to quickfix list
        end, { desc = "Add all hunks to quickfix" })

        map("n", "<leader>hq", gitsigns.setqflist, { desc = "Add file hunks to quickfix" })

        -- Toggles: show/hide git information
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
        map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

        -- Text object: select git hunks
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
      end,
    },
  },
}
