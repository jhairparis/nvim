local function has_eslint_config()
  local cwd = vim.fn.getcwd()
  local eslint_configs = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.yaml", ".eslintrc.yml" }

  for _, config in ipairs(eslint_configs) do
    if vim.fn.glob(cwd .. "/" .. config) ~= "" then
      return true
    end
  end

  -- Check parent directories
  local parent = vim.fn.fnamemodify(cwd, ":h")
  while parent ~= cwd do
    for _, config in ipairs(eslint_configs) do
      if vim.fn.glob(parent .. "/" .. config) ~= "" then
        return true
      end
    end
    cwd = parent
    parent = vim.fn.fnamemodify(cwd, ":h")
  end

  return false
end

require("lint").linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    if has_eslint_config() then
      require("lint").try_lint()
    end
  end,
})
