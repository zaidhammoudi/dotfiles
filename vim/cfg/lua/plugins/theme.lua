-- Light/dark theme switching. Uses tokyonight's matching styles:
--   dark  -> tokyonight-night   (matches the "Tokyo Night" terminal theme)
--   light -> tokyonight-day     (matches "TokyoNight Day")
-- Logic + the :Light / :Dark commands live in lua/config/theme.lua.
-- (tokyonight itself is already bundled by LazyVim, so no plugin spec needed.)
return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- LazyVim accepts a function here; it runs once at startup after the
      -- colorscheme plugin is available, so we register commands + apply the
      -- persisted mode from there.
      colorscheme = function()
        require("config.theme").setup()
      end,
    },
  },
}
