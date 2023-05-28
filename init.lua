-- local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
-- local command = require "core.command"

-- default config
config.trimwhitespace = true
config.fps = 60
config.animation_rate = 1.0
config.max_tabs = 8
config.blink_period = 0.8
config.message_timeout = 1
config.tab_type = "soft" -- soft for spaces, hard for real tabs (\t)
config.indent_size = 4   -- 4 spaces


------------------------------ Themes ----------------------------------------

--------------------------- Key bindings -------------------------------------
-- pass 'true' for second parameter to overwrite an existing binding
keymap.add {
  ["cmd+,"] = "ui:settings",
  ["cmd+shift+r"] = "core:restart",

  ["option+shift+up"]   = "doc:create-cursor-previous-line",
  ["option+shift+down"] = "doc:create-cursor-next-line",

  ["shift+return"] = "find-replace:select-previous",
  ["return"] = "find-replace:select-next",
  ["option+m"] = "bracket-match:move-to-matching",
  ["option+shift+m"] = "bracket-match:select-to-matching",
  ["cmd+shift+b"] = "treeview:toggle",
  ["cmd+shift+\\"] = "minimap:toggle-visibility",
  ["cmd+shift+'"] = "status-bar:toggle",
}

------------------------------- Fonts ----------------------------------------
-- font names used by lite:
-- style.font          : user interface
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code/editor
-- style.big_font      : big text in welcome screen

style.font = renderer.font.load("/Users/ihsanpraditya/Library/Fonts/Caskaydia Cove Nerd Font Complete Regular.otf", 15)
style.code_font = renderer.font.load("/Users/ihsanpraditya/Library/Fonts/Caskaydia Cove Nerd Font Complete Mono Regular.otf", 14)

------------------------------ Plugins ----------------------------------------
local lintplus = require "plugins.lintplus"
local lspconfig = require "plugins.lsp.config"

-- lintplus
lintplus.load({"shellcheck", "luacheck"})
lintplus.setup.lint_on_doc_load()
lintplus.setup.lint_on_doc_save()

-- lsp
lspconfig.gopls.setup {
  command = { "/Users/ihsanpraditya/go/bin/gopls" }, -- must open lite-xl within terminal
}
lspconfig.sumneko_lua.setup {
  command = { "/usr/local/bin/lua-language-server" },
}

---------------------------- Miscellaneous -------------------------------------

-- modify list of files to ignore when indexing the project:
config.ignore_files = {
  -- folders
  "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
  "^node_modules/", "^%.cache/", "^__pycache__/",
  -- files
  "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
  "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
  "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
  "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
}

