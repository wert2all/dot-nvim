return function(prefix)
  return {
    ["n"] = {
      ["<Leader>c"]   = { "Close current buffer", function() Snacks.bufdelete() end },
      [prefix .. "c"] = { "Close all buffers except current", function() Snacks.bufdelete.other() end },
      [prefix .. "C"] = { "Close all buffers",
        function()
          Snacks.bufdelete.other()
          Snacks.bufdelete()
        end
      },
    },
  }
end
