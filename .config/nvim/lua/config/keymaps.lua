
local cmd                  = vim.cmd
local replace = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
local session_file         = "~/.config/nvim/session/mysession.vim"
local save_session         = ":mksession! " .. session_file .. "<cr>"
local load_session         = ":source " .. session_file .. "<cr>"

local i  = "i"
local n  = "n"
local v  = "v"
local ni = { n, i }
local nv = { n, v }

local function m(mode, remap, action, description)
	vim.keymap.set(mode, remap, action, { desc = description })
end

--------------------------------------------------------------------------------

m(ni, "<esc>"     , "<cmd>noh<cr><esc>", "Escape and clear hlsearch"    )

m(nv, "<leader>y" , '"+y'              , "Global copy"                  )
m(n , "<leader>Y" , '"+yg_'            , "Global copy (after cursor)"   )
m(n , "<leader>yy", '"+yy'             , "Global copy (line)"           )
m(n , "<leader>p" , '"+p'              , "Global paste"                 )
m(n , "<leader>P" , '"+P'              , "Global paste (before cursor)" )

m(n , "<leader>fn", "<cmd>enew<cr>"    , "New File"                     )
m(n , "<leader>fx", cmd.Ex             , "Open file manager"            )
m(n , "<C-S>"     , "<cmd>e #<cr>"     , "Switch to alternative file"   )

m(n , "<"         , "<gv"              , "Indent selection"             )
m(n , ">"         , ">gv"              , "Unindent selection"           )

m(v , "J"         , ":m '>+1<cr>gv=gv" , "Move selection up"            )
m(v , "K"         , ":m '<-2<cr>gv=gv" , "Move selection down"          )

m(n , "<leader>l" , "<cmd>Lazy<cr>"    , "Lazy"                         )
m(n , "<leader>m" , "<cmd>Mason<cr>"   , "Mason"                        )

m(n , "n"         , "nzzzv"                                             )
m(n , "N"         , "Nzzzv"                                             )

m(n , "<leader>ss", save_session       , "Save session"                 )
m(n , "<leader>sl", load_session       , "Load session"                 )

m(n , "<leader>s" , replace            , "Replace string under cursor"  )

m(n , "Q"         , "<nop>"                                             )
m(n , "<C-6>"     , "<nop>"                                             )
