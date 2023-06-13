
local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
local sessionman = require'session_manager.utils'
local sessions = sessionman.get_sessions()

local dirs = {}

local filenames = {}

for _, file, _ in pairs(sessions) do
	print(file.filename)
	local directory = sessionman.shorten_path(file.dir)
	table.insert(dirs, directory);
	table.insert(filenames, file.filename);
end


local section = {
    title = "Section Title",
    icon = "->",
    setup = function(ctx)
        -- called only once and if the section is being used
    end,
    update = function(ctx)
        -- hook callback, called when an update was requested by either the user of external events (using autocommands)
    end,
    draw = function(ctx)
        return dirs;
    end,
	bindings = {
		["l"] = function (line, col)

			vim.cmd("SidebarNvimClose")
			local filename = filenames[line + 1];
			sessionman.load_session(filename, true);
		end,
	}
}

dump(section)
return {
	"/sidebar-nvim/sidebar.nvim",
	config = {
		sections = {
			section,
		}
	}

}

