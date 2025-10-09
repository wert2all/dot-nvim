local api = vim.api
-- Highlight when yanking (copying) text
api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- from https://github.com/adibhanna/nvim/blob/main/lua/config/autocmds.lua

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- mapping LSP keys
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    require("utils.mappings").map_group("lsp", { buffer = args.buf })
  end,
})

-- LspInfo
vim.api.nvim_create_user_command('LspInfo', require("utils.lsp").lsp_info,
  { desc = "Show comprehensive LSP information" })

-- mapping LSP keys
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client and client.name == "obsidian-ls" then
      require("utils.mappings").map_group("obsidian", { buffer = args.buf })
    end
  end,
})
