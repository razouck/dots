local function m(mode, remap, action, description)
	local set = vim.keymap.set

	if description == nil then
		set(mode, remap, action)
	else
		set(mode, remap, action, { desc = description })
	end
end
local substitution_command = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

------------------------------------------------------------------------------------------------------------------------

m({ "i", "n" }     , "<esc>"     , "<cmd>noh<cr><esc>" , "Escape and clear hlsearch"                  )

m({ "n", "v" }     , "<leader>y" , '"+y'               , "Copy to clipboard"                          )
m("n"              , "<leader>Y" , '"+yg_'             , "Copy content after the cursor to clipboard" )
m("n"              , "<leader>yy", '"+yy'              , "Copy line to clipboard"                     )
m("n"              , "<leader>p" , '"+p'               , "Paste from clipboard"                       )
m("n"              , "<leader>P" , '"+P'               , "Paste from clipboard (before cursor)"       )

m("v"              , "<"         , "<gv"               , "Indent selection"                           )
m("v"              , ">"         , ">gv"               , "Unindent selection"                         )

m("v"              , "J"         , ":m '>+1<cr>gv=gv"  , "Move selection up"                          )
m("v"              , "K"         , ":m '<-2<cr>gv=gv"  , "Move selection down"                        )

m("n"              , "<leader>fn", "<cmd>enew<cr>"     , "New File"                                   )
m("n"              , "<leader>fx", vim.cmd.Ex          , "Open file manager"                          )

m("n"              , "<leader>l" , "<cmd>Lazy<cr>"     , "Lazy"                                       )
m("n"              , "<leader>m" , "<cmd>Mason<cr>"    , "Mason"                                      )

m("n"              , "<leader>s" , substitution_command, "Replace string under cursor"                )

m("n"              , "n"         , "nzzzv"                                                            )
m("n"              , "N"         , "Nzzzv"                                                            )
m("n"              , "Q"         , "<nop>"                                                            )
