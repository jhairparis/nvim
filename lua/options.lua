require "nvchad.options"

local o = vim.o
local colors = dofile(vim.g.base46_cache .. "colors")

o.relativenumber = true

-- UFO folding
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Cambiar el color de fondo de la columna de plegado
vim.cmd(string.format([[ highlight FoldColumn guibg=%s ]], colors.bg))

-- o.cursorlineopt ='both' -- to enable cursorline!
