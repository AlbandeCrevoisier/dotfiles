-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set autoindent')
	vis:command('set relativenumber')
	vis:command('set colorcolumn 80')
	vis:command('set theme dark-16')
	vis:command('set syntax off')
end)
