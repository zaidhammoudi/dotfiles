-- Light/dark switching for nvim, mirroring the `light`/`dark` shell commands
-- that swap the cmux/ghostty theme. The choice is persisted to a state file so
-- new nvim sessions remember it (matching how the terminal config persists).
--
-- Usage inside nvim:  :Light   :Dark   (or the <leader>uB toggle keymap)

local M = {}

local state_file = vim.fn.stdpath("state") .. "/theme.txt"

function M.read()
  local f = io.open(state_file, "r")
  if not f then
    return "dark"
  end
  local mode = vim.trim(f:read("*a") or "")
  f:close()
  return mode == "light" and "light" or "dark"
end

function M.apply(mode)
  if mode == "light" then
    vim.o.background = "light"
    vim.cmd.colorscheme("tokyonight-day")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight-night")
  end
end

function M.set(mode)
  local f = io.open(state_file, "w")
  if f then
    f:write(mode)
    f:close()
  end
  M.apply(mode)
end

function M.toggle()
  M.set(M.read() == "light" and "dark" or "light")
end

-- Called from the LazyVim colorscheme hook at startup: registers the commands
-- and applies whatever mode was last persisted.
function M.setup()
  vim.api.nvim_create_user_command("Light", function()
    M.set("light")
  end, { desc = "Switch nvim to the light theme" })
  vim.api.nvim_create_user_command("Dark", function()
    M.set("dark")
  end, { desc = "Switch nvim to the dark theme" })

  -- <leader>ub is LazyVim's built-in background toggle (only flips
  -- vim.o.background). Use <leader>uB for the full switch that also swaps the
  -- tokyonight day/night colorscheme and persists the choice.
  vim.keymap.set("n", "<leader>uB", M.toggle, { desc = "Toggle light/dark theme (persisted)" })

  M.apply(M.read())
end

return M
