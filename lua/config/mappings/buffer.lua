return function(prefix)
  return {
    ["n"] = {
      ["<Leader>c"] = { "Close current buffer",
        function()
          local current = vim.api.nvim_get_current_buf()
          require('mini.bufremove').delete(current)
        end
      },
      [prefix .. "c"] = { "Close all buffers except current",
        function()
          local minibufremove = require('mini.bufremove')
          local current = vim.api.nvim_get_current_buf()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          for _, buf in ipairs(bufs) do
            local bufnr = buf.bufnr
            if bufnr ~= current then minibufremove.delete(bufnr, false) end
          end
        end
      },
      [prefix .. "C"] = { "Close all buffers",
        function()
          local minibufremove = require('mini.bufremove')
          local bufs = vim.fn.getbufinfo { buflisted = true }
          for _, buf in ipairs(bufs) do
            minibufremove.delete(buf.bufnr, false)
          end
        end
      },
    },
  }
end
