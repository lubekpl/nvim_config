-- Suppress common autocommand errors during startup
local function safe_autocmd(events, opts)
  pcall(function()
    vim.api.nvim_create_autocmd(events, opts)
  end)
end

-- Override the global autocmd creation to be safer
if vim.api.nvim_create_autocmd then
  local original_create_autocmd = vim.api.nvim_create_autocmd
  vim.api.nvim_create_autocmd = function(events, opts)
    return pcall(original_create_autocmd, events, opts)
  end
end

return {}