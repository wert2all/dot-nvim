return function(prefix)
  return {
    ["n"] = {
      [prefix .. "p"] = { "Preview git hunk", require("gitsigns").preview_hunk },
      [prefix .. "r"] = { "Reset hunk", require("gitsigns").reset_hunk },
      [prefix .. "R"] = { "Reset Git buffer", function() require("gitsigns").reset_buffer() end },
      [prefix .. "l"] = { "Git log", function() Snacks.picker.git_log() end },

      ["[G"]          = { "First Git hunk", function() require("gitsigns").nav_hunk('first') end },
      ["]G"]          = { "Last Git hunk", function() require("gitsigns").nav_hunk('last') end },

      ["]g"]          = { "Next git hunk", function() require("gitsigns").nav_hunk('next') end },
      ["[g"]          = { "Previous git hunk", function() require("gitsigns").nav_hunk('prev') end },

    },
    ["v"] = {
      [prefix .. "r"] = { "Reset hunk", function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end }
    },
  }
end
